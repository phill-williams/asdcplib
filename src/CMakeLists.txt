set(OPENSSL_ROOT_DIR "/usr/local/opt/openssl")
find_package(OpenSSL 1 REQUIRED COMPONENTS)
find_library(XercescppLib_PATH NAMES xerces-c xerces-c_3 PATHS "${PROJECT_SOURCE_DIR}/../xercescpp" "${PROJECT_SOURCE_DIR}/../lib/xercescpp" "$ENV{CMAKE_HINT}/xercescpp" ENV CMAKE_HINT PATH_SUFFIXES "lib")
find_library(XercescppLib_Debug_PATH NAMES xerces-cD xerces-c_3D xerces-c PATHS "${PROJECT_SOURCE_DIR}/../xercescpp" "${PROJECT_SOURCE_DIR}/../lib/xercescpp" "$ENV{CMAKE_HINT}/xercescpp" ENV CMAKE_HINT PATH_SUFFIXES "lib")
find_path(XercescppLib_include_DIR NAMES xercesc/dom/DOM.hpp PATHS "${PROJECT_SOURCE_DIR}/../xercescpp" "${PROJECT_SOURCE_DIR}/../lib/xercescpp" "$ENV{CMAKE_HINT}/xercescpp" ENV CMAKE_HINT PATH_SUFFIXES "include")
set(UseRandomUUID OFF CACHE BOOL "")
set(libs_only TRUE)

# This lib. doesn't export from dll with __declspec(dllexport). So this lib. must be built statically on Windows.
if(NOT WIN32)
	set(BUILD_SHARED_LIBS true CACHE BOOL "Build shared or static libs?" FORCE)
endif(NOT WIN32)

# ----------libkumu----------
# source
set(kumu_src KM_fileio.cpp KM_log.cpp KM_prng.cpp KM_util.cpp KM_xml.cpp KM_tai.cpp)

# header
set(kumu_src ${kumu_src} KM_fileio.h KM_log.h KM_prng.h KM_util.h KM_xml.h KM_tai.h KM_error.h KM_memio.h KM_mutex.h KM_platform.h dirent_win.h)

# ----------libasdcp----------
# source
set(asdcp_src MPEG2_Parser.cpp MPEG.cpp JP2K_Codestream_Parser.cpp JP2K_Sequence_Parser.cpp JP2K.cpp PCM_Parser.cpp Wav.cpp 
	TimedText_Parser.cpp KLV.cpp Dict.cpp MXFTypes.cpp MXF.cpp Index.cpp Metadata.cpp AS_DCP.cpp AS_DCP_MXF.cpp AS_DCP_AES.cpp
	h__Reader.cpp h__Writer.cpp AS_DCP_MPEG2.cpp AS_DCP_JP2K.cpp AS_DCP_PCM.cpp AS_DCP_TimedText.cpp PCMParserList.cpp MDD.cpp
	AS_DCP_ATMOS.cpp AS_DCP_DCData.cpp DCData_ByteStream_Parser.cpp DCData_Sequence_Parser.cpp AtmosSyncChannel_Generator.cpp
	AtmosSyncChannel_Mixer.cpp PCMDataProviders.cpp SyncEncoder.c CRC16.c UUIDInformation.c
)

# header for deployment (install target)
set(asdcp_deploy_header AS_DCP.h PCMParserList.h AS_DCP_internal.h KM_error.h KM_fileio.h KM_util.h KM_memio.h KM_tai.h KM_platform.h KM_log.h KM_mutex.h dirent_win.h)

# header
set(asdcp_src ${asdcp_src} Wav.h WavFileWriter.h MXF.h Metadata.h JP2K.h AS_DCP.h AS_DCP_internal.h KLV.h MPEG.h MXFTypes.h MDD.h
	PCMParserList.h S12MTimecode.h AtmosSyncChannel_Generator.h AtmosSyncChannel_Mixer.h PCMDataProviders.h
	SyncEncoder.h SyncCommon.h CRC16.h UUIDInformation.h dirent_win.h
)

# ----------as02----------
# source
set(as02_src h__02_Reader.cpp h__02_Writer.cpp AS_02_ISXD.cpp AS_02_JP2K.cpp AS_02_PCM.cpp ST2052_TextParser.cpp AS_02_TimedText.cpp AS_02_ACES.cpp ACES_Codestream_Parser.cpp ACES_Sequence_Parser.cpp ACES.cpp AS_02_IAB.cpp)

# header for deployment (install target)
set(as02_deploy_header AS_02.h Metadata.h MXF.h MXFTypes.h KLV.h MDD.h AS_02_ACES.h ACES.h AS_02_IAB.h AS_02_internal.h)

# header
set(as02_src ${as02_src} AS_02.h AS_02_internal.h AS_02_ACES.h ACES.h AS_02_IAB.h)


include_directories("${PROJECT_SOURCE_DIR}/src" "${OPENSSL_INCLUDE_DIR}" "${XercescppLib_include_DIR}")

add_definitions(/DPACKAGE_VERSION=\"${VERSION_STRING}\" /DHAVE_XERCES_C=1)
if(WIN32)
	add_definitions(/DKM_WIN32 /D_CONSOLE /DASDCP_PLATFORM=\"win32\" /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_WARNINGS)
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SAFESEH:NO")
elseif(UNIX)
	add_definitions(/DASDCP_PLATFORM=\"unix\")
endif(WIN32)

if(UseRandomUUID)
	add_definitions(/DCONFIG_RANDOM_UUID=1)
endif(UseRandomUUID)

set(CMAKE_DEBUG_POSTFIX _d) # Append "_d" if debug lib.

add_library(libkumu STATIC ${kumu_src})
target_link_libraries(libkumu general "${OPENSSL_CRYPTO_LIBRARY}" debug "${XercescppLib_Debug_PATH}" optimized "${XercescppLib_PATH}")
set_target_properties(libkumu PROPERTIES PREFIX "" VERSION ${VERSION_STRING} SOVERSION ${VERSION_MAJOR})

add_library(libasdcp STATIC ${asdcp_src})
target_link_libraries(libasdcp general "${OPENSSL_CRYPTO_LIBRARY}" libkumu)
set_target_properties(libasdcp PROPERTIES PREFIX "" VERSION ${VERSION_STRING} SOVERSION ${VERSION_MAJOR})

add_library(libas02 STATIC ${as02_src})
target_link_libraries(libas02 general  "${OPENSSL_CRYPTO_LIBRARY}" libasdcp)
set_target_properties(libas02 PROPERTIES PREFIX "" VERSION ${VERSION_STRING} SOVERSION ${VERSION_MAJOR})

# add the install target for libs
install(TARGETS libkumu libasdcp libas02 EXPORT asdcplibtargets RUNTIME DESTINATION bin LIBRARY DESTINATION lib ARCHIVE DESTINATION lib INCLUDES DESTINATION "${OPENSSL_INCLUDE_DIR}" "${XercescppLib_include_DIR}")
install(FILES ${as02_deploy_header} ${asdcp_deploy_header} DESTINATION include)
install(EXPORT asdcplibtargets DESTINATION targets)

if(NOT libs_only)
	add_executable(blackwave "blackwave.cpp")
	target_link_libraries(blackwave general libasdcp)
	if(WIN32)
		target_link_libraries(blackwave general Advapi32.lib)
	endif(WIN32)

	add_executable(wavesplit "wavesplit.cpp")
	target_link_libraries(wavesplit general libasdcp)
	if(WIN32)
		target_link_libraries(wavesplit general Advapi32.lib)
	endif(WIN32)

	add_executable(kmuuidgen "kmuuidgen.cpp")
	target_link_libraries(kmuuidgen general libkumu)
	if(WIN32)
		target_link_libraries(kmuuidgen general Advapi32.lib) 
	endif(WIN32)

	add_executable(kmrandgen "kmrandgen.cpp")
	target_link_libraries(kmrandgen general libkumu)
	if(WIN32)
		target_link_libraries(kmrandgen general Advapi32.lib) 
	endif(WIN32)

	add_executable(kmfilegen "kmfilegen.cpp")
	target_link_libraries(kmfilegen general libkumu)
	if(WIN32)
		target_link_libraries(kmfilegen general Advapi32.lib) 
	endif(WIN32)

	add_executable(klvwalk "klvwalk.cpp")
	target_link_libraries(klvwalk general libasdcp)
	if(WIN32)
		target_link_libraries(klvwalk general Advapi32.lib) 
	endif(WIN32)

	add_executable(asdcp-test "asdcp-test.cpp")
	target_link_libraries(asdcp-test general libasdcp)
	if(WIN32)
		target_link_libraries(asdcp-test general Advapi32.lib) 
	endif(WIN32)

	add_executable(asdcp-wrap "asdcp-wrap.cpp")
	target_link_libraries(asdcp-wrap general libasdcp)
	if(WIN32)
		target_link_libraries(asdcp-wrap general Advapi32.lib) 
	endif(WIN32)

	add_executable(asdcp-unwrap "asdcp-unwrap.cpp")
	target_link_libraries(asdcp-unwrap general libasdcp)
	if(WIN32)
		target_link_libraries(asdcp-unwrap general Advapi32.lib) 
	endif(WIN32)

	add_executable(asdcp-info "asdcp-info.cpp")
	target_link_libraries(asdcp-info general libasdcp)
	if(WIN32)
		target_link_libraries(asdcp-info general Advapi32.lib) 
	endif(WIN32)

	add_executable(asdcp-util "asdcp-util.cpp")
	target_link_libraries(asdcp-util general libasdcp)
	if(WIN32)
		target_link_libraries(asdcp-util general Advapi32.lib) 
	endif(WIN32)

	add_executable(j2c-test "j2c-test.cpp")
	target_link_libraries(j2c-test general libasdcp)
	if(WIN32)
		target_link_libraries(j2c-test general Advapi32.lib)
	endif(WIN32)

	add_executable(as-02-wrap "as-02-wrap.cpp")
	target_link_libraries(as-02-wrap general libas02)
	if(WIN32)
		target_link_libraries(as-02-wrap general Advapi32.lib) 
	endif(WIN32)

	add_executable(as-02-unwrap "as-02-unwrap.cpp")
	target_link_libraries(as-02-unwrap general libas02)
	if(WIN32)
		target_link_libraries(as-02-unwrap general Advapi32.lib) 
	endif(WIN32)

	add_executable(as-02-info "as-02-info.cpp")
	target_link_libraries(as-02-info general libas02)
	if(WIN32)
		target_link_libraries(as-02-info general Advapi32.lib)
	endif(WIN32)

	# add the install target for exes
	install(TARGETS blackwave wavesplit kmuuidgen kmrandgen kmfilegen klvwalk asdcp-test asdcp-wrap asdcp-unwrap asdcp-info asdcp-util j2c-test as-02-wrap as-02-unwrap as-02-info RUNTIME DESTINATION bin)
endif()
