use strict;
use warnings;
use Test::More tests => 68;
use Digest::EdonR qw(edonr_224 edonr_224_hex);

my $len = 0;

while (my $line = <DATA>) {
    chomp $line;
    my ($msg, $digest) = split '\|', $line, 2;
    my $data = pack 'H*', $msg;
    $digest = lc $digest;

    if ($len and not $len % 8) {
        my $md = Digest::EdonR->new(224)->add($data)->hexdigest;
        is($md, $digest, "new/add/hexdigest: $len bits of $msg");
        is(
            edonr_224_hex($data), $digest,
            "edonr_224_hex: $len bits of $msg"
        );
        ok(
            edonr_224($data) eq pack('H*', $digest),
            "edonr_224: $len bits of $msg"
        );
    }

    my $md = Digest::EdonR->new(224)->add_bits($data, $len)->hexdigest;
    is($md, $digest, "new/add_bits/hexdigest: $len bits of $msg");
}
continue { $len++ }

__DATA__
00|A9C2BC54208BE171CDFD054D21D97C1F4C79E822D8D9FCDBCB1D602F
00|49600EE29FE2925E28662B3768F30178967FDD45CB4D62B4A6C99EA1
C0|7322E6F440367B95F29B8D3ACBD0F81EF677ED8CF26F6C1FECFF9F6F
C0|92C7F2450928105BC221A74640103B50AC2B37C2506CBB4D9A337670
80|5DECCD0B4EE8006C3185F255BFBF5FDC488DA6E304E4A2F0C63DC542
48|E0D07FCA39119A3243364D5DA5FB3294672E72C83A4BA5756C411E8E
50|59C7F1ED68BF2073D65AC253FB4103B538724FAC7E118FAC7A3D1D91
98|FD169AE3D4F3F8B9766E22666ADF6BDD5369DC9ABC8CFAC74177D21A
CC|48EA6E4643B29553013D27F5CEB87C3960BF8769DD94EE5C9EA3545F
9800|9144198965E9AC79D894C4A11C9552B5380FFB91F737A58C26F6607B
9D40|D74903BBE246B57EB3D317BD45645A269E3F3708CE553BF3D454563B
AA80|A9715ABABA962EDCF010C0CF710D039682848DA12A7EB9F17B5F3686
9830|71B48E22489DDC2F2334E2A4D3F2BC31C21DE7F93FDE291D11104647
5030|5B16B2159D1726DE2609F685E8AB5574DC658C287CBDECDEDA5430E2
4D24|E5327B26A7D3ACF8F54DBF629B6E1C7668D08B96656CC632EE9322F6
CBDE|D1688666EECC30EF90B76F94A8B2E0011C97F77E01430D068C3EE0BB
41FB|ABEC1572891ED90AB9164A9DF7CC3628B8F98395E99521766DF2B8EC
4FF400|2D1C27D568F9A2DD1E38F79F16D1F1A88551F0367482BDA7C0BC4864
FD0440|3759AC4DC2C8ED9B9E54906551E388CEF7EB6158AC131CC7D2371C07
424D00|DAEA48C29354E22289B07899E940145D052E8A2C1475E12C2E4DE07D
3FDEE0|5CDF67704EE97E4DE1C4403041042D5B8F6F7B1D660A0DA6141D7783
335768|5708035CE70224B23515747762B2379192FCD6744B84C4264A207119
051E7C|ADEBBBADD8EEDC9B67827CE63735C51322A49F2CBF7D3C4018506521
717F8C|E3FD7A50A1A0A3A3E1AC69AD60D5580F3E7692E95F39C7C02F56DBE0
1F877C|66D8D2CD60A13AEC9FD6663788CC16BA8ABCC518CEB60613E5107D45
EB35CF80|51F3487B4A0068F9246303EA80B02A5AB073372324C2968C410C4FF5
B406C480|529C918B11091BE6B4BC066084C2A909CF35D1CE3F5225FF4FC9B274
CEE88040|4EBBA92F018D83973D6E3D5C48D8ED16965DBF544714E5EC62ABCC10
C584DB70|3B3F1EDA7A5721AB8144F9D4A79EFD2BEB57A39AB3A743C04787F404
53587BC8|8A3AC7635694C86A33C25329C1C6274980BD48B395647F0E21BFD567
69A305B0|B1C643917F18ACED31ED25A4C512F673CB68498D50A59A5C042776EA
C9375ECE|8963EEF09B14F79C1BC97B2F68730363512A9295CF0476077078CB7E
C1ECFDFC|572A60EFC9BA2E56B94022881259D7E05CCB17DCAD8C22692D073F43
8D73E8A280|8E9E8C6D71CF1429D637583DA7A1CDB336D60A5318D11B5BBFFAE0A4
06F2522080|E0DBC296BFC853D7F14BC330C3B47E0F2346FB6792759417ECCC54C1
3EF6C36F20|A2CB2A5D635030DBAF86DB7D400A7AC6841B10B7A8092C5306435AF3
0127A1D340|CB61E08122E7A7C721B4910F6F6D00AC67ACBBEA0624BA17FC5B678E
6A6AB6C210|9CA30282AD4DC21C7F7858A707ECD33A21F6251F81F2AD07E859876B
AF3175E160|DD5BBF529F50C2A0B43A06C0D9183509A38068A80E18EFC20DB702BE
B66609ED86|536B7250B168AEB28BEBE33B39D7F0E1C312A09D3F6966E1FF53016E
21F134AC57|91C9E1ED190F4EB4B0DC7751DFD52C9F31BF9822E5E7749548D79116
3DC2AADFFC80|4644D0DB73588460FA6E15CD04A6CADE32CB99E485F6A02996647D2A
9202736D2240|B04C4A783CF78CF804076C90FD64570136ADBC1C6AE63942F3EF2078
F219BD629820|7FDB3D43FDC237EAC62836B0BBB61E26E3F3FA91FEC35084DDB1391A
F3511EE2C4B0|AD5DC6F4FE0B7B9DCF6C6B19402EE16089573B1914CBFA332D8BCDF4
3ECAB6BF7720|BC038B5F240F5FDF7601E17227F6BB03035CA2F71623D8B12D25F893
CD62F688F498|42666467043ADC054142429C7F9CDC25552510D89D02FC41C0DE3E78
C2CBAA33A9F8|36819CA22F37A8772FECF690035826CA9DBEEA44CF7413E70F58EE76
C6F50BB74E29|E6A0515BC07B6415494485F07536ADE9CCEDFA757F897523F9C68785
79F1B4CCC62A00|4D8C54BF9D0BA5E84CE335B1C69EF1CFF927267363F9B6AF766DACAC