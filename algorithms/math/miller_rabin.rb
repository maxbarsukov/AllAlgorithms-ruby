# frozen_string_literal: true

# A Ruby implementation of the Miller–Rabin primality test

# The Miller–Rabin primality test or Rabin–Miller primality test is a probabilistic primality test:
# an algorithm which determines whether a given number is likely to be prime,
# similar to the Fermat primality test and the Solovay–Strassen primality test.
# It is of historical significance in the search for a polynomial-time deterministic primality test.
# Its probabilistic variant remains widely used in practice, as one of the simplest and fastest tests known.

def miller_rabin_prime?(num, precision = 10)
  return true if num == 2
  return false if num.even? || num <= 1

  d = num - 1
  s = 0

  while d.even?
    d /= 2
    s += 1
  end

  precision.times do
    a = 2 + rand(num - 4)
    x = a.pow(d, num)
    next if x == 1 || x == num - 1

    (s - 1).times do
      x = x.pow(2, num)
      return false if x == 1

      break if x == num - 1
    end
    return false if x != num - 1
  end

  true
end

puts 'Check prime numbers:'
[2, 3, 7, 97, 211].each do |data|
  puts "\tmiller_rabin_prime?(#{data}): #{miller_rabin_prime?(data)}"
end

puts 'Check non-prime numbers:'
[-1, 1, 4].each do |data|
  puts "\tmiller_rabin_prime?(#{data}): #{miller_rabin_prime?(data)}"
end
puts "\tmiller_rabin_prime?(1_178_615_158_383, 10): #{miller_rabin_prime?(1_178_615_158_383, 10)}"
puts "\tmiller_rabin_prime?(2_199_178_615_158_383, 100): #{miller_rabin_prime?(2_199_178_615_158_383, 100)}"

puts 'Check big prime numbers:'
test_numbers = [
  94_366_396_730_334_173_383_107_353_049_414_959_521_528_815_310_548_187_030_165_936_229_578_960_209_523_421_808_912_459_795_329_035_203_510_284_576_187_160_076_386_643_700_441_216_547_732_914_250_578_934_261_891_510_827_140_267_043_592_007_225_160_798_348_913_639_472_564_715_055_445_201_512_461_359_359_488_795_427_875_530_231_001_298_552_452_230_535_485_049_737_222_714_000_227_878_890_892_901_228_389_026_881,
  138_028_649_176_899_647_846_076_023_812_164_793_645_371_887_571_371_559_091_892_986_639_999_096_471_811_910_222_267_538_577_825_033_963_552_683_101_137_782_650_479_906_670_021_895_135_954_212_738_694_784_814_783_986_671_046_107_023_185_842_481_502_719_762_055_887_490_765_764_329_237_651_328_922_972_514_308_635_045_190_654_896_041_748_716_218_441_926_626_988_737_664_133_219_271_115_413_563_418_353_821_396_401,
  123_301_261_697_053_560_451_930_527_879_636_974_557_474_268_923_771_832_437_126_939_266_601_921_428_796_348_203_611_050_423_256_894_847_735_769_138_870_460_373_141_723_679_005_090_549_101_566_289_920_247_264_982_095_246_187_318_303_659_027_201_708_559_916_949_810_035_265_951_104_246_512_008_259_674_244_307_851_578_647_894_027_803_356_820_480_862_664_695_522_389_066_327_012_330_793_517_771_435_385_653_616_841,
  119_432_521_682_023_078_841_121_052_226_157_857_003_721_669_633_106_050_345_198_988_740_042_219_728_400_958_282_159_638_484_144_822_421_840_470_442_893_056_822_510_584_029_066_504_295_892_189_315_912_923_804_894_933_736_660_559_950_053_226_576_719_285_711_831_138_657_839_435_060_908_151_231_090_715_952_576_998_400_120_335_346_005_544_083_959_311_246_562_842_277_496_260_598_128_781_581_003_807_229_557_518_839,
  132_082_885_240_291_678_440_073_580_124_226_578_272_473_600_569_147_812_319_294_626_601_995_619_845_059_779_715_619_475_871_419_551_319_029_519_794_232_989_255_381_829_366_374_647_864_619_189_704_922_722_431_776_563_860_747_714_706_040_922_215_308_646_535_910_589_305_924_065_089_149_684_429_555_813_953_571_007_126_408_164_577_035_854_428_632_242_206_880_193_165_045_777_949_624_510_896_312_005_014_225_526_731,
  153_410_708_946_188_157_980_279_532_372_610_756_837_706_984_448_408_515_364_579_602_515_073_276_538_040_155_990_230_789_600_191_915_021_209_039_203_172_105_094_957_316_552_912_585_741_177_975_853_552_299_222_501_069_267_567_888_742_458_519_569_317_286_299_134_843_250_075_228_359_900_070_009_684_517_875_782_331_709_619_287_588_451_883_575_354_340_318_132_216_817_231_993_558_066_067_063_143_257_425_853_927_599,
  103_130_593_592_068_072_608_023_213_244_858_971_741_946_977_638_988_649_427_937_324_034_014_356_815_504_971_087_381_663_169_829_571_046_157_738_503_075_005_527_471_064_224_791_270_584_831_779_395_959_349_442_093_395_294_980_019_731_027_051_356_344_056_416_276_026_592_333_932_610_954_020_105_156_667_883_269_888_206_386_119_513_058_400_355_612_571_198_438_511_950_152_690_467_372_712_488_391_425_876_725_831_041
]
test_numbers.each do |data|
  puts "\tmiller_rabin_prime?(#{data}): #{miller_rabin_prime?(data, 1000)}"
end
