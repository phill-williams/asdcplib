#!/usr/bin/perl
#
#

use strict;
my $rng_prog = $ARGV[0];

die "Expecting RNG program name as argument" unless ( -x $rng_prog );

my $test_count = 0;

while ( my $line = <DATA> ) {
    if ( $line =~ /^XKey = (\w{40})/ ) {
	my $XKey = $1;
	my $XSeed = <DATA>;
	my $Xval = <DATA>;
	die if ( $Xval !~ /^X = (\w{80})/ );
	$Xval = $1;
	system("$rng_prog $XKey $Xval");
	die "Test vector failure at test $test_count: $XKey $ Xval\n" if ( $? != 0 );
	print STDERR '.';
	$test_count++;
    }
}

print STDERR "\nfound $test_count test cases\n"


# FIPS186_VSTGEN_XChange_Sha1.txt
__DATA__
[Xchange - SHA1]

COUNT = 0
b = 160
XKey = 8000000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = da39a3ee5e6b4b0d3255bfef95601890afd8070992d5f201dc6e0e4efff2fabad419d4bf7e41fa58

COUNT = 1
b = 160
XKey = c000000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = fccbeb651889c0c4836c2f94ebf67bbe59af0ef8f21ae5a3ff0c67ed1c578a6f1223fd2130f5638a

COUNT = 2
b = 160
XKey = e000000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = b0f74533c0072c2c99d241a4c5f4c73bc396fdf247dcb245b337d3cf9531142a8f2a1d132a3b72c1

COUNT = 3
b = 160
XKey = f000000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 3f87039d81ff007b02d2a4cbf1eb28be42ad9fc3e793c4c4403c8183b7b063b1ff2a476c86a29150

COUNT = 4
b = 160
XKey = f800000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 76aae1571999ccf26fc1d8050da716fcd1d4601ed4032c82f7e5331aecca066455117e6c8eec204e

COUNT = 5
b = 160
XKey = fc00000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 28de1e50400afdd50328f7d165a6664989fb8a27d952a36ea896bfcd1e3135c544194985fd436b69

COUNT = 6
b = 160
XKey = fe00000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = faf212c7824683ba4c58ea4de177714250bbbaa1b9bf77a7ccf493955f00dff8902fd8fd0af446d9

COUNT = 7
b = 160
XKey = ff00000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 3c48a3452a597b40b448ee99eef36221b91a9fc98cfc3f73c492cd2dcb4c8512d7ce16198f41d9e0

COUNT = 8
b = 160
XKey = ff80000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 02db90873dafeddd6b909280cb08ad51b7ac97782aafa0e44b2ecfbe98648fbdc70388e6c4bc138e

COUNT = 9
b = 160
XKey = ffc0000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 7dcfc01746dede2322bad50d179a069a7808ab2272cd1b8a0fb3b8504ed443ce30a109a2af82abf5

COUNT = 10
b = 160
XKey = ffe0000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 290b3a3b277cccc4bc9893835b017bad8c0cf5be20ec5fbe6ca4174fbcacf1f2ce325270974e2782

COUNT = 11
b = 160
XKey = fff0000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = dc8397bfd2baad0409746d9e4c3bb0ce32b981b09b7ed6dafaa1d11f4a063d55c315572796f92a3a

COUNT = 12
b = 160
XKey = fff8000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = a422b968f8864f33e73a7d248ba5e664d312796cb229e54cc63a7429da530f4df0732d2cb1f17e66

COUNT = 13
b = 160
XKey = fffc000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = dafa5baadb51bc19fa716e066ec6cfb476cf4d66ea2e3a41c0d192080efc71bbaa74e15f3671333c

COUNT = 14
b = 160
XKey = fffe000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = f4107d1d55ce2f2eea18e62f36e67c6cb834072989882745f96d2b055d73aa511a72930862816a3c

COUNT = 15
b = 160
XKey = ffff000000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = bec44e48afa08c1ddd4d003d731eb3fa92ccfba7a22e2b34133693c520647cbdb5c67662400a78ab

COUNT = 16
b = 160
XKey = ffff800000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 4d74c089c13a33eb2870dd2c57baa69c8d13d9bdd086c5ed1eee776e1b405fed8187ec338ff2e404

COUNT = 17
b = 160
XKey = ffffc00000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 35fd5500ed91ea2750740be274fa9819997c246d6e4568f78f0de506c7eb89a82cfd7b7a38d89752

COUNT = 18
b = 160
XKey = ffffe00000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d7f5a4bf869c4dda9967e10e15e45d713ad616e7135e579e8feec4c3295118d0f2b102ce44746d2f

COUNT = 19
b = 160
XKey = fffff00000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d875ec45e85c07e11996b56fee6e7efab3f152c36092d82e4f560c907b286da58325a61900cbe98b

COUNT = 20
b = 160
XKey = fffff80000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 6485831589eee689e84dcb9af46aa3a124d85657ba82f2ad8cf01bcbbc75ba775366b535d7a47896

COUNT = 21
b = 160
XKey = fffffc0000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 17e0dd120fa8cb7a16eb17228270e338f37b158ea22c0c486d4b1992d6d5f20636ca838271805440

COUNT = 22
b = 160
XKey = fffffe0000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 919d8d62befb49c68520c5a458b00d0577033f47b6ac4fe8b8abf3d9991696bc6fe213960c645a42

COUNT = 23
b = 160
XKey = ffffff0000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 56e2e117e2c73527e3971c9d3bffb5379cef75d157f93aff7b051dd7fdd8611666689a3e3526c0ce

COUNT = 24
b = 160
XKey = ffffff8000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = fcf9e6f9bfc8cf6d46c760ed213331594d95a895c47beeeaa4b7129ca8c4b249e477a46af5e16ac9

COUNT = 25
b = 160
XKey = ffffffc000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = e01170df33061c4cb1d123fb0a9e186af468a87696ea8e48f5f1697e51595f58d1e6e7e3440f1407

COUNT = 26
b = 160
XKey = ffffffe000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 936940fd12fc688855f8a6d0be2722e4294bb0d0af94aa51b0a2f0d93f080daeaf9bfcd8f4c01e82

COUNT = 27
b = 160
XKey = fffffff000000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 6e0abd8f57f876296a237fc17b2181a5bbe0d6e82a7a36d59c9a68e13e40e9e8136d4c0ccf0acd6b

COUNT = 28
b = 160
XKey = fffffff800000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = dd7de50650bbd6b86e88eba9ea428f0a2b340cc0a361f0053cd1447a4c9d4d5e2d42f114d033eafe

COUNT = 29
b = 160
XKey = fffffffc00000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 52bb6338b2b72fd29167b40caa34123232f770ab7808cfe6f3cb148502d89ff5a80b4ac0778faaeb

COUNT = 30
b = 160
XKey = fffffffe00000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = ae017f7b0e253701216941e1c9d7821f077bfdc3bcd4a02603a2d63d1849072801d78482fa84dc50

COUNT = 31
b = 160
XKey = ffffffff00000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 6bca6679907d54bd1254ee87ded30591305d436c2f552f28f4ec1f7fbac29a25c3dcb7e630cc41e1

COUNT = 32
b = 160
XKey = ffffffff80000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 72253fe10d13536bc715464d28ae70cd8dcea9451e6140ee837caddb81de309497e7f95d0fcf09d6

COUNT = 33
b = 160
XKey = ffffffffc0000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 5784b0627abe62043f7b9fb08e54eaf067c7c6a8f8dbcae34dcd15a7f9bf9b52fef7ff90b792a8f8

COUNT = 34
b = 160
XKey = ffffffffe0000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 815abfe389de4cb500ea789dd04042f81817fcae3d7a9fbb50b251676653ef671eb29f47cce6ff65

COUNT = 35
b = 160
XKey = fffffffff0000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 3152b9db05fb216edc61782d254a38533988200d02b72cf15cd4404f7e9f4f823544e693889ea3ca

COUNT = 36
b = 160
XKey = fffffffff8000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 1158d881597e94db9cdfb79997a571740ae24386dcb0cbafe2e20d2b6cca811a98dc0ebb65028296

COUNT = 37
b = 160
XKey = fffffffffc000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 7a252c33152e04374a51c36a8ff386a9125983993d0bfaa073738384128969404434b3ad3badf8dc

COUNT = 38
b = 160
XKey = fffffffffe000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = f22ee43a5dafca77e87b0d2eb6fe202ce0fcc83da391d6a9ca5cd6865744256866d09531ccd9c1a9

COUNT = 39
b = 160
XKey = ffffffffff000000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = ac6fffbb332e9e733de0f3a85404e22d0c9c53cfc2226a3cb08df3747e541904d9909f05d5932cee

COUNT = 40
b = 160
XKey = ffffffffff800000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 909649b02d9bbf2da624a40a4c5dcec233e58f41ffc0d1b8c0810a1cce89f25cebf40d576f27b808

COUNT = 41
b = 160
XKey = ffffffffffc00000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 7328500ca54c4fb9eddf8e3ecf2e851b0f8821ac5f1823e77dd73e8cb2e4727ba9e7f2de71737c0c

COUNT = 42
b = 160
XKey = ffffffffffe00000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 2bf06c06d4c1c11276718320c886c74dabb7fd92ccf743e2023909a6d33ff8a42a56f8879804219e

COUNT = 43
b = 160
XKey = fffffffffff00000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = a812af3c2f0ee5615688b966b8885e75a7c76be5e5c9518347f6f23475ed601f556f50a253f64463

COUNT = 44
b = 160
XKey = fffffffffff80000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d9e4f7719a31e05bc6f07779b4eed313c94346d6a1485c5847f0e7ed5dbd8bf5c4e5ea847207739b

COUNT = 45
b = 160
XKey = fffffffffffc0000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 4b3f3951c0eac34ee8562fb4b7f2d5e7787b0ba705ba474fc13ec9d99f7877ad4b934d7111ee1ccc

COUNT = 46
b = 160
XKey = fffffffffffe0000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 41212672a59e2f50dc0e55107df6fe6e1a6f0806012517058efa8678e1b5709579aeff58d4523a1f

COUNT = 47
b = 160
XKey = ffffffffffff0000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d279d878c380f846f5790f32881f689d3463ef4f577c7bedb83dcdae06aeefe0acf28bc6abc398d6

COUNT = 48
b = 160
XKey = ffffffffffff8000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = cc2adbd3e9389f19a44bc74585c926de5383f0aaf7591019deffb70cf2106934a09b7c3bb7d36a57

COUNT = 49
b = 160
XKey = ffffffffffffc000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = aab87ca3ecfd8b84cf2a804d7dfd79f181657c6660e1cffaf9bce87899064b9ef85f4d4edd5b9c97

COUNT = 50
b = 160
XKey = ffffffffffffe000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d05170a4077035b188e903decf7cd0c8d738c65ebf3d345962da2e10cc480a0e6dac962e784437ea

COUNT = 51
b = 160
XKey = fffffffffffff000000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = df094f91e6e721f7f5c8920cc8699d50d6d2e26677e0595f7ed1fbec275013d9eaec9f8ff0192eba

COUNT = 52
b = 160
XKey = fffffffffffff800000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 840b7bf475412aec0ed426bfc95dbff1dfb3c01993744a1cd5cd57ee1c72157c4576f6fc868e4d67

COUNT = 53
b = 160
XKey = fffffffffffffc00000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 081c963bfa542131e47a6f824702c81d036170c059d320a7347371e92e8019b0a5a6b674626d1e91

COUNT = 54
b = 160
XKey = fffffffffffffe00000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 68f04715ea256ee6e48c02d2916a1488d40ec866e1d6a5add4abaef3b8323e62b6693514f14c3db7

COUNT = 55
b = 160
XKey = ffffffffffffff00000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d3d213d73d9738b9179949641a17cd7a2e4866623e01941575430a978c5edf326cd5215b3bd74e30

COUNT = 56
b = 160
XKey = ffffffffffffff80000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 68c5582035c3644249e3412eb70336617bc4a593850312fed7a20d25115d1f001f9abbfd118c7753

COUNT = 57
b = 160
XKey = ffffffffffffffc0000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 12d6de348e76dd0f6380b13bd88d43ea2d5b7c443d794a3fb7758590a1dfa5f34cd9dfff104cbbf5

COUNT = 58
b = 160
XKey = ffffffffffffffe0000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = a9f1c1cad88416a12c6108de1971198fbd6057f3efe49495894a4e2a69a5ea8714cb3a57b37b93ac

COUNT = 59
b = 160
XKey = fffffffffffffff0000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 789e072cc3185a627d92945339bb1950e915e989dc1490d2b59a054ca1c20017c1bee4aaf9757b5f

COUNT = 60
b = 160
XKey = fffffffffffffff8000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 5509de87994a508680b545fa58aab69cb142f2badf1021645e7430d02cdf6111b0afe66cb7678af0

COUNT = 61
b = 160
XKey = fffffffffffffffc000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 802cae54caf47f45d5ab352f10cd47774a5895bf29b60f2bb7d20da67d2ee5943de44ddda445367c

COUNT = 62
b = 160
XKey = fffffffffffffffe000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 18001b828028eb44228fa7421cceaba5e12b4feb1ad7c57483d64c39d5d99f737002be9f13162c89

COUNT = 63
b = 160
XKey = ffffffffffffffff000000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = cb8128e1cbc093306b23da2814d1265dd0d2f9774dd164f011e4fedc044c308b8800057c18ab5a4e

COUNT = 64
b = 160
XKey = ffffffffffffffff800000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d7aec22fb3704dd2ddc721c4d715630a400a15fd192cd7e3627387b47b58fc39d5be4064822b3aad

COUNT = 65
b = 160
XKey = ffffffffffffffffc00000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 45e7933ada2666ca8cd76e4778f290bf41378c217e0286bb1e95ee2f2f7c1eb698248e821b4a0656

COUNT = 66
b = 160
XKey = ffffffffffffffffe00000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 9eba05157ea9936e6521eb5807b0026c8542d607ea8bce39861123448752f40b4d2fc456d53c34f4

COUNT = 67
b = 160
XKey = fffffffffffffffff00000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 07b692581741a1e7ee37425c524b1d82662e46b155889af1b444290e586edba269f0f38042ebe9b5

COUNT = 68
b = 160
XKey = fffffffffffffffff80000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = c71b439ca40ac57e1ec5d9ad4383ee8b61d370b5807590d7fdbfdca963f1b1d4b29092cbb598d1f6

COUNT = 69
b = 160
XKey = fffffffffffffffffc0000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 3b49c50cd7d319774f91275892f751d1c3bc50a38fb3ee13955c718d67c917307a8888dbd1f55339

COUNT = 70
b = 160
XKey = fffffffffffffffffe0000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = aece9cdcd70b4f65d63c9c2d10a612ac4f24725d0111932147bddee3436d37d15b7354240685bdee

COUNT = 71
b = 160
XKey = ffffffffffffffffff0000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = ac4b24ba0c7976303566e2a0a51959849958db04a001d82153acd09e33ee71efebe458c4f9543119

COUNT = 72
b = 160
XKey = ffffffffffffffffff8000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 495660a402a40de3f1375ae40e076c7c2aa044287d9930572bb6b13ce419f22a6bf9ae63fd603b3a

COUNT = 73
b = 160
XKey = ffffffffffffffffffc000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d985a58306469ecc0651d039ac8610fc9e71ccd4cdf9c6d1715c4197850e11e39bd27e2ec49801d4

COUNT = 74
b = 160
XKey = ffffffffffffffffffe000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 42aa31de6a5ce807b14c2e3ad91d91589119da04103cfc7c94860eebe6b4bcae6ba069033c0366ad

COUNT = 75
b = 160
XKey = fffffffffffffffffff000000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 6e8cb43e720c5533ba5fc017c4df8c6f278f2dad63ae8154a2720e077cf423b995c835b068e27fa5

COUNT = 76
b = 160
XKey = fffffffffffffffffff800000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d038ba69be6edad3cb10e5ef9638214e4da3aa23571c1fd2ce9d56b294ab48738339876367af37c1

COUNT = 77
b = 160
XKey = fffffffffffffffffffc00000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = d0404a3aa63f64da9dd9ac380b6610a7a49c0e342f98bdc235fb6055ff3d786602bf62cdd8add78e

COUNT = 78
b = 160
XKey = fffffffffffffffffffe00000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = be00ae42cbaf9b94b803549533607a0f69154c0008d2de3b583b2616c74b36566ae767ff34b86654

COUNT = 79
b = 160
XKey = ffffffffffffffffffff00000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 2f02675d18bc26297f4368b634e1ebdf2c5ab677e84f33d437481adebdc5e7bfc556fe6f45072c6a

COUNT = 80
b = 160
XKey = ffffffffffffffffffff80000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = f633f34bb5166cebfecde2295ce7648dec442ff159765c7a86332beb46f7842133f5a3ed6960a3f0

COUNT = 81
b = 160
XKey = ffffffffffffffffffffc0000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = fdd3881997edbedfe956fc8a013afd072a73c70bbb31390a0fd756b7337863b43fd820ae4e257180

COUNT = 82
b = 160
XKey = ffffffffffffffffffffe0000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 7d5b95d8bd5db5df0b91df0edb1f287118a57d459b94a90a6e1a0524fd141be752e802c5c6f5fa61

COUNT = 83
b = 160
XKey = fffffffffffffffffffff0000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = bf8d570e5f9299df9dd93db0c809ff6bfbb35481e2283705a9676727a84d02e2b8883828a05f1bdc

COUNT = 84
b = 160
XKey = fffffffffffffffffffff8000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = bdcabf104dfec16b2a484df9596abda1d4b72afcf8cee6bf749c4bc0c124df9b29b11785d487d54f

COUNT = 85
b = 160
XKey = fffffffffffffffffffffc000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 79d4b08aa8efc652f2f81a5f58d1af456806686fe495d25db5ed36dd034d3e71eb0fcb35d7b0b903

COUNT = 86
b = 160
XKey = fffffffffffffffffffffe000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = a8d1aef1f8cf16a0c6dbe31542ca390e77bc5be962c1e7cbfb0ef37196b95236b8e105b96da055de

COUNT = 87
b = 160
XKey = ffffffffffffffffffffff000000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 13df68dd0de319394623acd11181384072c2b120a6dc9f090faeaa03484d0862e50cbd2502d963c6

COUNT = 88
b = 160
XKey = ffffffffffffffffffffff800000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 07cc9dbedb074f9ecce0e3ea54f59d943f57c4fa4909c59e7b2c513f77d4b7c0c30d10bb77e0617f

COUNT = 89
b = 160
XKey = ffffffffffffffffffffffc00000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 6b5da347070676406474673f0ca9ca10624f01d965cbdf2975442fc134c0c50ef1bf2ae000ec67a5

COUNT = 90
b = 160
XKey = ffffffffffffffffffffffe00000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 3dec2b91ba61d60714bba70628413436e238fb0ca9178e7b50ffcadeeb1c3c72536b90ea2d2ce965

COUNT = 91
b = 160
XKey = fffffffffffffffffffffff00000000000000000
XSeed = 0000000000000000000000000000000000000000
X = f69d9a2891892b60cfeb504f17fb6ee0a30cbee1cb27802af04191e8386e7a0f612f2bd4d6665f3b

COUNT = 92
b = 160
XKey = fffffffffffffffffffffff80000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 4f78f5e39217be13e1d57aa3f4d55e5955a8ef5c5a98e8e02fb7807b4a885c2de8f64bbb42390302

COUNT = 93
b = 160
XKey = fffffffffffffffffffffffc0000000000000000
XSeed = 0000000000000000000000000000000000000000
X = df5c9790c61dde09a272c5c5f5c78e867b10a2e0e18ed67114e130c3af1442d3fe13c53e3072ac60

COUNT = 94
b = 160
XKey = fffffffffffffffffffffffe0000000000000000
XSeed = 0000000000000000000000000000000000000000
X = ce06588dccb3d9b8fd40076e57c29bc22d90bd4d56676d8dad83d750be12da19b3a7fea0dde986f4

COUNT = 95
b = 160
XKey = ffffffffffffffffffffffff0000000000000000
XSeed = 0000000000000000000000000000000000000000
X = afca72d4d8eeac89452c2d8240611385de4dd1d05d9db6a1b1d0e7df7fa49075c44fd3df0a8f4797

COUNT = 96
b = 160
XKey = ffffffffffffffffffffffff8000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 65d921596731fb52bc87a79d8996475530015bbd3fb24e206cffb17f8cb92a20cbb434cc13aafbd4

COUNT = 97
b = 160
XKey = ffffffffffffffffffffffffc000000000000000
XSeed = 0000000000000000000000000000000000000000
X = 3ff9c54cc76869bd329ea6fe65935e036900e82df945466a0875379c065121fc5e5620a51adb48bb

COUNT = 98
b = 160
XKey = ffffffffffffffffffffffffe000000000000000
XSeed = 0000000000000000000000000000000000000000
X = c30a129ddf99ca2ddf8aa065607facbcf86b3b9382cf694fdcb2f55321a52c87c7ab0d701fcf0ab9

COUNT = 99
b = 160
XKey = fffffffffffffffffffffffff000000000000000
XSeed = 0000000000000000000000000000000000000000
X = c81cb8b066027949826b69b919960c0096e0e9f2eeb9e53d2acbd3b40a92470a5665d31582a38b93

COUNT = 100
b = 160
XKey = fffffffffffffffffffffffff800000000000000
XSeed = 0000000000000000000000000000000000000000
X = eba40737de37c4fb7f9931fd455bc6c32a184dd44f524c7dd9681ba0b995df8d7fe461c5df6c3c2b

COUNT = 101
b = 160
XKey = fffffffffffffffffffffffffc00000000000000
XSeed = 0000000000000000000000000000000000000000
X = 4d4d5aa335b046fcdf9ea069e938f9b662f22286a6a9146296843a0579c5ce81f338517cd7baef4e

COUNT = 102
b = 160
XKey = fffffffffffffffffffffffffe00000000000000
XSeed = 0000000000000000000000000000000000000000
X = 885b0b6662bc6a1315020e801f4b0400e202fae240441a93e3aa4117745ecb7cd870a77b5fec12f6

COUNT = 103
b = 160
XKey = ffffffffffffffffffffffffff00000000000000
XSeed = 0000000000000000000000000000000000000000
X = d27612b331bf2ebd86c6b018020a284d58dbbd8a90216cdc7d5292c8d69361d19bdfe54da83ff0a8

COUNT = 104
b = 160
XKey = ffffffffffffffffffffffffff80000000000000
XSeed = 0000000000000000000000000000000000000000
X = 77fc40d4b1690236b746fdca741541467344caa0715ce6d2abeb8288a3913499e82425717a013d5c

COUNT = 105
b = 160
XKey = ffffffffffffffffffffffffffc0000000000000
XSeed = 0000000000000000000000000000000000000000
X = ff32e03b70d7bd9786dc0515cfca1e0f94bee4f22cceead4066accae3d9ee320aeca667367a84acb

COUNT = 106
b = 160
XKey = ffffffffffffffffffffffffffe0000000000000
XSeed = 0000000000000000000000000000000000000000
X = e66d2df35bfd3e697069825d96d9d60d113c032f2f772136624475e024f18c5e14b3172155307af3

COUNT = 107
b = 160
XKey = fffffffffffffffffffffffffff0000000000000
XSeed = 0000000000000000000000000000000000000000
X = 1c903f71d11d598fe1bf4a79e98b7e7d5d1cb3f700dd7a1dd476ae9bb3d49ec940f56ea03a22659c

COUNT = 108
b = 160
XKey = fffffffffffffffffffffffffff8000000000000
XSeed = 0000000000000000000000000000000000000000
X = 074c8a6168c9c7df3a87bc57f6eb23251ba7052049ac327af36b12fdbaa4b4b055bc8d680cb8d3f9

COUNT = 109
b = 160
XKey = fffffffffffffffffffffffffffc000000000000
XSeed = 0000000000000000000000000000000000000000
X = 8534b835c335c2866bf8e5ddf686c6d4a2a1d4802454314f1e1eedad06355a3c6b39b44c3aa7ecc9

COUNT = 110
b = 160
XKey = fffffffffffffffffffffffffffe000000000000
XSeed = 0000000000000000000000000000000000000000
X = 6adcebdf6badfdbaf3675ae97d7da3da4d4a93122c7da68c74f19d3404f143e8c8f7cfb74bbd6415

COUNT = 111
b = 160
XKey = ffffffffffffffffffffffffffff000000000000
XSeed = 0000000000000000000000000000000000000000
X = 8fc7605166aeed6c1d9795bb5aff9a44c6aba7dfca1b0d8b101c78fdc7e3bfd65f4076ca600c1288

COUNT = 112
b = 160
XKey = ffffffffffffffffffffffffffff800000000000
XSeed = 0000000000000000000000000000000000000000
X = 52798b5b8df1b2bfa466713b346961906c210b0bbc40e5b7a62bb4c70ae41a9447b224537ddd14de

COUNT = 113
b = 160
XKey = ffffffffffffffffffffffffffffc00000000000
XSeed = 0000000000000000000000000000000000000000
X = a0f58dafbc95601dd59de0dd47cadfe1ea34e9925ba468099308a9450fb52c97db57b4214e58bdce

COUNT = 114
b = 160
XKey = ffffffffffffffffffffffffffffe00000000000
XSeed = 0000000000000000000000000000000000000000
X = e19df3f756485974d6381865503eaba161c90d0cecfa163e27fffd5248d31f5bb7a1b92a862b3ad3

COUNT = 115
b = 160
XKey = fffffffffffffffffffffffffffff00000000000
XSeed = 0000000000000000000000000000000000000000
X = 35c284d7dcb6d6623ea34be1371db0b325b3920564e55828a288be312d610666af76f44254964077

COUNT = 116
b = 160
XKey = fffffffffffffffffffffffffffff80000000000
XSeed = 0000000000000000000000000000000000000000
X = 989ce65ed122d1405de7a57664f7ac705cb9b5aaed3b6f05e227229c23c575c4b18e88335eb2c81a

COUNT = 117
b = 160
XKey = fffffffffffffffffffffffffffffc0000000000
XSeed = 0000000000000000000000000000000000000000
X = 05d73bc99c91150aa39840544b5bd3b46251bbced56f79000c63f0166d0ca62ed4b9cd3b17afc68b

COUNT = 118
b = 160
XKey = fffffffffffffffffffffffffffffe0000000000
XSeed = 0000000000000000000000000000000000000000
X = 758355389548decb4d674f76b286cdfc71f85b7169be18b6b7ac546847056f2a9c9f096dffb27afc

COUNT = 119
b = 160
XKey = ffffffffffffffffffffffffffffff0000000000
XSeed = 0000000000000000000000000000000000000000
X = da754c2f1101e44c12a64ce93d7e038531c114df55ce1b0ef8d213ad6f2f43d210e91e1a93f655bf

COUNT = 120
b = 160
XKey = ffffffffffffffffffffffffffffff8000000000
XSeed = 0000000000000000000000000000000000000000
X = 2ff3dc5be596d44376eba1b07c8a0048f66d2782b0a1340d919ce12b5dbf2f36c7ce543c55a24dea

COUNT = 121
b = 160
XKey = ffffffffffffffffffffffffffffffc000000000
XSeed = 0000000000000000000000000000000000000000
X = 75e6528a68783de77204a15162f84d71f180abba9d9a8e6d239531595f028a116ec0e2c835675762

COUNT = 122
b = 160
XKey = ffffffffffffffffffffffffffffffe000000000
XSeed = 0000000000000000000000000000000000000000
X = 0a1a7503b77852574e366b0117eb3861e8515dfbb3d2dd9fb374146930c4d25590214777c782e203

COUNT = 123
b = 160
XKey = fffffffffffffffffffffffffffffff000000000
XSeed = 0000000000000000000000000000000000000000
X = bc36f8b79d84ab9263f87eaed6252f6bca8fe8df30c91e9427fe4d3d41842460c7a3450c2f300045

COUNT = 124
b = 160
XKey = fffffffffffffffffffffffffffffff800000000
XSeed = 0000000000000000000000000000000000000000
X = 0d824e023491df1aabaeb6737dd61d5aed1b2c874dfda9d4a5b84acd3176e132dd6c29bc47c125f8

COUNT = 125
b = 160
XKey = fffffffffffffffffffffffffffffffc00000000
XSeed = 0000000000000000000000000000000000000000
X = 512664fb393f2b5621292dd26815a78d220847fa1ea1ce8935a07da2e1b12e7299c24b806f24d431

COUNT = 126
b = 160
XKey = fffffffffffffffffffffffffffffffe00000000
XSeed = 0000000000000000000000000000000000000000
X = 950f07a99423ef6afef65ee6da5afc9689f4ad74ce4c86a684398596230f42aee9ad7a185c335347

COUNT = 127
b = 160
XKey = ffffffffffffffffffffffffffffffff00000000
XSeed = 0000000000000000000000000000000000000000
X = 411e11e04b566e3b991613ac2fc1937ca252a7430d18d62106b6088e384a9df4740aca77e822d484

COUNT = 128
b = 160
XKey = ffffffffffffffffffffffffffffffff80000000
XSeed = 0000000000000000000000000000000000000000
X = 7f7aaa087a285980a31c1db915b6bb499e1d9d0a8bdc7f7cbec229a634d9d1a90ca57dcc2fa70f21

COUNT = 129
b = 160
XKey = ffffffffffffffffffffffffffffffffc0000000
XSeed = 0000000000000000000000000000000000000000
X = d3d39e0f1128aca1a6d509730d6eb42cadaf249fc287351728912d33ab57a6665db1b96ebceddd19

COUNT = 130
b = 160
XKey = ffffffffffffffffffffffffffffffffe0000000
XSeed = 0000000000000000000000000000000000000000
X = 3ac0800d44e2f327fdcbd61cdcd7075afce0676f04526a0d0fa9617d8e243ea592af8092db30f5d6

COUNT = 131
b = 160
XKey = fffffffffffffffffffffffffffffffff0000000
XSeed = 0000000000000000000000000000000000000000
X = e742ad48abc285207e067251344b1c68155dab1d59d2c0b1210e1cfae4a5f27ae29d3d9515ec5d11

COUNT = 132
b = 160
XKey = fffffffffffffffffffffffffffffffff8000000
XSeed = 0000000000000000000000000000000000000000
X = b32b0cc4e26f0bcc19ba1aa95533a816d362389af8f81600805c0647d5d8cd64f43d85090e0d200a

COUNT = 133
b = 160
XKey = fffffffffffffffffffffffffffffffffc000000
XSeed = 0000000000000000000000000000000000000000
X = 30e347b89c94e6ab2baaadc98f299b24b00ddc8a615def35bfd9194cedbd64d6e924a9ff7a06f33a

COUNT = 134
b = 160
XKey = fffffffffffffffffffffffffffffffffe000000
XSeed = 0000000000000000000000000000000000000000
X = c32afe8f42a86036e221607635baa6cbcaf3aeda185a17ba1af4707a84977edfb73e42c3d731f3a5

COUNT = 135
b = 160
XKey = ffffffffffffffffffffffffffffffffff000000
XSeed = 0000000000000000000000000000000000000000
X = f6f062e0f58342e472de9f624373541656b77cacebf5a2db800646f03ede6316a08985f95d554d17

COUNT = 136
b = 160
XKey = ffffffffffffffffffffffffffffffffff800000
XSeed = 0000000000000000000000000000000000000000
X = d5a9fec94ed0a7840d9d93d1978c89bbdefff4524a091f4dc4ef6834f787ba5dcccd20b6a22c945f

COUNT = 137
b = 160
XKey = ffffffffffffffffffffffffffffffffffc00000
XSeed = 0000000000000000000000000000000000000000
X = 8a0bc648ba06d5d56f77e31610f41808fce53b436b8b2016c7d788aed7c832c7672d7edad73c75b4

COUNT = 138
b = 160
XKey = ffffffffffffffffffffffffffffffffffe00000
XSeed = 0000000000000000000000000000000000000000
X = 90f3cfc64efc79e0acc670373a89960800775edac7d130c5f80c0bdc7f393fbc898deae1032d5de1

COUNT = 139
b = 160
XKey = fffffffffffffffffffffffffffffffffff00000
XSeed = 0000000000000000000000000000000000000000
X = 182b43626fb350fb68ecdb2e7e468d2297e0faf86b79954c04c253f9aebc8e24837b0a3098bcd501

COUNT = 140
b = 160
XKey = fffffffffffffffffffffffffffffffffff80000
XSeed = 0000000000000000000000000000000000000000
X = f2142110ad487a61e4284154ad9326f7bb21496f6759340d991c96df76648d82e7f9939304d10f3f

COUNT = 141
b = 160
XKey = fffffffffffffffffffffffffffffffffffc0000
XSeed = 0000000000000000000000000000000000000000
X = 1175fd3fc41d7339a3003087664c97569a8c230b148a898071b3cbe97e5a285249bfae8a1b4d5535

COUNT = 142
b = 160
XKey = fffffffffffffffffffffffffffffffffffe0000
XSeed = 0000000000000000000000000000000000000000
X = 95942d02ee8f3dd6a341e393d977a90d9d0ef6c3e365ecde89fedecd0219698f4de70d37d939d07e

COUNT = 143
b = 160
XKey = ffffffffffffffffffffffffffffffffffff0000
XSeed = 0000000000000000000000000000000000000000
X = dc3d4ab9764f3e7b25784c64c22452c03dabd02ca03c1f871dd8c5ebcf525e9946a2c1d5d259de01

COUNT = 144
b = 160
XKey = ffffffffffffffffffffffffffffffffffff8000
XSeed = 0000000000000000000000000000000000000000
X = cf11ac36a96972cdbb7f35150dd344e4d1341325ee4a44ff09bd9c53108998b5d04b5f07f2bd5300

COUNT = 145
b = 160
XKey = ffffffffffffffffffffffffffffffffffffc000
XSeed = 0000000000000000000000000000000000000000
X = 5fe0bd81f1801a3ffa3d3e493075d4120c952f53cca22cbd803abe278f9fdb124502de6066021ad0

COUNT = 146
b = 160
XKey = ffffffffffffffffffffffffffffffffffffe000
XSeed = 0000000000000000000000000000000000000000
X = 7859276d44f3a10f844010a375d3eb078e443d28da1de77d77dc3cfe79739027c8f448952df50b76

COUNT = 147
b = 160
XKey = fffffffffffffffffffffffffffffffffffff000
XSeed = 0000000000000000000000000000000000000000
X = b6f311fce947d8de23b678566ca64cddc3404c1da4a888c3b19781d904b437534d397307e6f6d41b

COUNT = 148
b = 160
XKey = fffffffffffffffffffffffffffffffffffff800
XSeed = 0000000000000000000000000000000000000000
X = 7af5b5e370d5be661bdd57cdfb81b2aa165ec0e47cec20bddfcaf0fc48711c1d12530e3b5b439cb1

COUNT = 149
b = 160
XKey = fffffffffffffffffffffffffffffffffffffc00
XSeed = 0000000000000000000000000000000000000000
X = 2a738e1979d44cb91c43734026208d39bc20e48cabfa98d32debed67ac44349ef7def37d69a59ab2

COUNT = 150
b = 160
XKey = fffffffffffffffffffffffffffffffffffffe00
XSeed = 0000000000000000000000000000000000000000
X = a660765d616ba5b347c6ed86a7009c42ffd9f746f0ab945b21ec5e4a65de2866f89534aed10fb5f8

COUNT = 151
b = 160
XKey = ffffffffffffffffffffffffffffffffffffff00
XSeed = 0000000000000000000000000000000000000000
X = 71cd5ad24edfaeacc9daa6b7670e449b52e0766e2a86db40ecf512883ed1d3d28e1bb6b8dc763c9e

COUNT = 152
b = 160
XKey = ffffffffffffffffffffffffffffffffffffff80
XSeed = 0000000000000000000000000000000000000000
X = 42f628ec7de1c6f7a2a08232512d8369fbc79d1d9211928ad40bd0fee4fcd0b27099ea868024f97c

COUNT = 153
b = 160
XKey = ffffffffffffffffffffffffffffffffffffffc0
XSeed = 0000000000000000000000000000000000000000
X = e02365404191d8469d5e3022921027f0d27aa372f3d76956b261390f3f880f2fa32a8440a5301c82

COUNT = 154
b = 160
XKey = ffffffffffffffffffffffffffffffffffffffe0
XSeed = 0000000000000000000000000000000000000000
X = 439347cebc1782cc675e2bc25c0cacafe2d3a1b40305f10889ee9cdb4c58ef68d970e94b08556636

COUNT = 155
b = 160
XKey = fffffffffffffffffffffffffffffffffffffff0
XSeed = 0000000000000000000000000000000000000000
X = 59626e8b9318c3c9f46e1a8fac4693faca8ee1ea548a98ab441c6c088ddb58b03d2b5a69708bc26d

COUNT = 156
b = 160
XKey = fffffffffffffffffffffffffffffffffffffff8
XSeed = 0000000000000000000000000000000000000000
X = ffd98581d37523fbc53de4a87d5abe516420343f62277bfc3956607d759e63dd89728ef434dc902d

COUNT = 157
b = 160
XKey = fffffffffffffffffffffffffffffffffffffffc
XSeed = 0000000000000000000000000000000000000000
X = 624048e1eeb7325f7e3251da67f79341bdbd00b0005951d0fec9b327eeb5ff178a7f502d8f57c42b

COUNT = 158
b = 160
XKey = fffffffffffffffffffffffffffffffffffffffe
XSeed = 0000000000000000000000000000000000000000
X = 089fc77cf8929c246fcee00b92c27676cca08e7598a1213777c0cda53c7016b09667e974f4b1173b

COUNT = 159
b = 160
XKey = ffffffffffffffffffffffffffffffffffffffff
XSeed = 0000000000000000000000000000000000000000
X = ce8dd97eb53de8b8997d71af15eed31ffc822deb269cb566a0a9645811a3d9c977c5d8fbe8ddf6bb

