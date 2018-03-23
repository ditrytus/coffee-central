pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--coffee central
--by jakub gruszecki

-- SYSTEM FUNCTIONS

function _init()
end

function _update()
end

function _draw()
 drawBackground();
 drawMenu();
end

function drawBackground()
 rrectfill(screen, black);
end

function drawMenu()
 menuRect = gridToScreen({x=0, y=13, width=16, height=3});
 borderRect(menuRect, brown, red);
end

-- GLOBAL CONSTANTS

screen = {
 x = 0, y = 0,
 width = 128, height = 128
};

black = 0;
dark_blue = 1;
dark_purple = 2;
dark_purple = 3;
brown = 4;
dark_gray = 5;
light_gray = 6;
white = 7;
red = 8;
orange = 9;
yellow = 10;
green = 11;
blue = 12;
indigo = 13;
pink = 14;
peach = 15;

-- GRID 8x8

grid = {
 width = 8, height = 8
};

function gridToScreen(rect)
 return {
  x = grid.width * rect.x,
  y = grid.height * rect.y,
  width = grid.width * rect.width,
  height = grid.height * rect.height
 };
end

-- RECTANGLES

function borderRect(rectangle, backColor, borderColor)
 rrectfill(rectangle, backColor);
 rrect(rectangle, borderColor);
end

function rrectfill(rectangle, color)
 rectfill(
  rectangle.x,
  rectangle.y,
  rectangle.x + rectangle.width - 1,
  rectangle.y + rectangle.height - 1,
  color);
end

function rrect(rectangle, color)
 rect(
  rectangle.x,
  rectangle.y,
  rectangle.x + rectangle.width - 1,
  rectangle.y + rectangle.height - 1,
  color);
end
__gfx__
5540540504050505040000555555555555555555555555555555555555555555555545f454454545454454545454545454545454545445445454545454554545
404004040404004050404000405545540454554545454545455454554554545f54f594595f934434434545404054040404434459595959593444044545454043
04044040504004054000004505405f5555555555555555553434345434f5ff59f39f349595444344444340445443959543944395459545954939439439093445
090090404040500040404004553543043043454345955954545543fff3f93434454443454434443434404543434434044043495affafaf4a4934934909040904
40400905090040405004005504040455455053455555555345545440445444543443444344434444434934090f55049399f9ffffff4f4a459594449040954595
5034004505405004090054345555343043454554340400400404004090404594394939493495934340400a495ff505f4ff3ffafaf3afffaf9f99349395439043
0000040040405400500400405434045404355543453404044345904543939f4f95f54554040404040404443457f555939f9fff3fffffafff934f954444445944
000000404040040045040004050450430454555545434300404343434445430404040909095454545943594f57f4554f9faffffffff6ffff9f95939393443434
000000043400504050004034345343454303434555545404040004045344443939faffa4a5afa4a434494f343755559fffff3ff37f3f343ff349494949344443
00000004054040040450040504554555545455434555343404543444939fafff7f6ff6fffff4f5f99f9349f46f34503495affff77fff7affaff3454504040004
0000005044005405400400453405f34543055554345454434459493949f96fff7f77f7fff939f9ff59f94f55fff55459faffa7ff3f3f55400040434945439959
00500043040400400404000455567f304543455543555344343454959ffa7af7a7f7f3ffffffff9f934f49f65f545505455555554545455ff5af4a4595945943
000000044340400904303405345f675555543455545454540944a59ff95f5ff77737f7f7f7f395f9f4afa5f5f655455454459fffff7a7fffffffff394a554304
00000000045034004040040455567690434034343434343434554434344343f3f77777f3fffffff3f4545f5f5ff554343afff3f3f365f435343ff9f344a45050
000000440404004043404055543f7655555455455545544409394a445594fff6f777777ffa645404434095f5f545455554355434f5f535f545fffff94a505055
00500000450450900450040555f6ff34543455554354353454545450f534af366f77f77fffa050400055f5ff5f3434545543f6f6366f6566537fff3f5f943550
000000540500400404050543455ff54555555434554344454395934034ff5f6f63f7777fff5004000046f654f54f54345f5f5565f6566f6656ffff9f4a54054a
0000000509040504040400055f6fff54345434555545550445954005f35f6f66f6677773ff900050556f6ff5ff5f5ff5f5f5ff7676f665765f37ffff5af45505
00505004050404054040504545f5f5545534555434354345434340555ff66f677766777fff555504f765f5f555f5555554553f5f6365666665fff3f94ff50355
000000040409040430404055f5959434545554345545409044445555f6f6767767f67777ff405f56555f6f5ff5543454355455556f6f56f56577ff3f4fa45455
000050404050040440400434434555455434554554343453439305ff6f3677677766777fa7f5f55454f55f555f4f543454434545556f63665f77ffff39f55555
00000509045405040404545f54345543545f543434554544454555536ff6776777673776ff455f5ff3ff6ffff667f6fff3f543454055456563f7ffff5fa45f56
05454040040340509005343f545534545554345455f55430959005f55f3555656666777f55ff5ff3f77777777777777677777ff3f4345f565577ffff4ff55555
0040404434040400545454555554554343f5f5f3454340904554505555555f563f6f677f35fafff777777777777777777777777afff395f6667f3fff5a4955f5
0004434040404045555555554555555454555545f34554343440050555f3f577665667f34a3f77777777777777777777777777777ffff343f57ffffffff50555
4040044404309050405040555545540505045555543434090945050545443f5ff6f667f454aff7f77777777777777777777777777af93456f377fffa5fa45055
04344040904055435a5f6f5ff36534345434040045444445434050439534f43f3563f773934a3aff777777777777777777777a7af3f34345547ff3ff4ff55355
0400434040443faf77ff77777777777776f6f34040555343449405005455555456f6677ff95459393afa7a7f7f7ffff7afafa3939095ff565377ffff3fa45f65
5404090540934397ff77777777777777777677ff3a545444343004055053455666566fff3ff043495939393a9393a395393434543435536556f7ffff4ff55556
0434040450404343a3afaf77777777777777777f7faa34345944555534555555566567ffff900005004045959f95943455a54355565566555377fffffaf45565
409045404043440454343a3af7f77f77777a77ffa73f4349095055555555555565f56f7fff6050f550040a6f3ff55f5f555655f65665665655f7f3ff5ff35565
040434434445034044345443934393f3af3f3af3f39344043495005050555555556537f3fff5d17754055fffffff5556f65555555555565553ffffffaff55555
434090444054040404054304593454934395434390409394495050455505555f5555f7ffff55d176d05f5fff3fff5f56556565f56665665556f7ffff5fa55555
4090404044040509040040455545554545434544343454345594500555f55f5356553fffff65dd66d56666fffff3f5655f55556555555656537ff3fffff45f66
405434434040404054040903453434593434f34595f5954939500554343934f54555ffffaff5c576617666ffffff53f5655555f55765f65665fffaff3ff34555
5409044454343404043400454545455545954ff34f434354449050505455555355553ff5ff6d6d76616666ff3ff9f56555555555555555555577ff9ffaf55556
0540904404404040400040934343434f3434395ff34ff495395550405050555555555ffff956d6666d766ffffff343f5665556635665665556ffff6f4ff55666
54509434440450405404505545454f545f4f5ff493f43594599455555540555555555ff3fffd6666657666ff3ffff55f5555555f5556566553f3ffffffa55555
090404443443443440900454343434343434f43ff4ff954344304345555550555555fff9fff56d666d7677fffff55f5656f655665765765555fffa5a5ff55555
04343404404504045040405545f5454f5f43fff5f35f3f495990455555555555f5553ff59ff6667766767ff6aff3f566565655555555555555ffffff4fa45656
434444040404040404040045554345545454543444454434434535555555555556554faff4f54565f543ffff5fff5555655656653665666555fffffafff55565
445409434434540904340404004040430403454553955959599045555550555555555ff43f905000504003ffafff5553565555555565556555af9f693f955565
4343404440405404090090050405340043405534540345954f5505055055555555555faf4950045000004fff5ff555555f6f6f5f65f56555557fff5f4ff55555
44445404540409040540404500545f4345ff593f3fffff39599505053455555555555ffffff056d5000006fffaff5656355556555555556555faf9ff9f955556
43409090904550434043440040f3f3fff3f3ffffff3f3f49595555545434f555555559f95950d6d100000ff3fff5f565656556565556555555fffffa5ff55515
443409045434444040404054045fff3fffff6f3f3fffff59549455555545555555555fa4fff0d76555d05fffffff5656556656566655665553ff95f93f95536f
0443444344004540904040434343f5ff3f3f3ffff73f3ff4a43043555535550555555ff394f0666d1f6d5fff3fa55555565f6f565f55555555faff4f4ff55455
0444504409090404509090040543ff3ffffffff3fffff34f599545f55545555505555f94f4f0677dd66d53f4ffff56655655555555f5555555ff4aff9f95555d
3454344090434040900405404596f3ff3f3f3f6ff3ffff9595f035555f565555555559f39ff06666576d5fffff3455655565365655656556559ff4395ff553f6
9040909090409090434040455535f5f5fffff3f3ff3f3f5959954f5656555f5455555f95f4f56766d76655affff35555555666556565555555afa4f93f945555
434044340904340444040405454ff3ff3f3fffff6fffff9595f055555555505555555f495965676667765fff9ff45555555555555555550505f4f4f494355555
4443444340440454340450905435ff3ff5f3f3f3f3f3f3ff493450505055555555454f3f4f4567f6d76f5ff3ffff5f666f5f5f5f3f5f5ffff5f939f3494f5f66
409045444340440904340404340454545454f444444444934f94a49f99f99f9f9fafa49434f5666657665ffffafffffffffffaffffaffaffaf954f44ff93fafa
434044544454344044443404040405043455f343439554f943f4ffa4ff43ff939ff4fff94f45f7fff7ff5fff4f3f6af3f7affffaff9fffaff9fa49f959f9ff5a
444340904090409090044504090344040954394454534f4f49f344f394f9434f43959595ff9ffffffffffaff3fffffffa6ffffff3fff34f5f3fff34f3f4f4af5
540934443404343454404443054004340954f3434344593f459435443434f45f4543454345343435555555544343455555050504504045040400450403050040
440444344090440434090040404540434343444f4434349434004400454555430500434554540404543404305400504004034050050050505050005040504050
43454090904340440905434043043404544f395434f4f5f954400404054345450450405455000000000504540554505550450555055050405055505050305055
443440409040934344090404044343939554f54f45f3f95954340404090434550400543454340550500540343f53450555304034050340504300555554055505
a439094543404444390404343045f554343434343f45f5f93440904043404344005040434040405040053405ffff340000004034345553435f55f5f555005555
5ff543440454340440543440455454544445a444434349594434040045434543404055403430040000454005f676f500000035555055555ff3455f3435055550
543444094340443454040450040430434345f43444434f593444344043454345450043454545045450555f555777f343400005f555f55555f55555f54505f345
00443443040434409045404543404404094344959544f9f4434090445454345400405434355540000055f65557f6677ff00005f35034305fff355f65350f5455
400904454340909095043450404509090543f345543955a495909309043454354590545544350455043057ff53755f3f5500055f406450555f5556f550035555
09044344045434090454440403405045495459595954ff4f3454549344553445954343434345004005f6f3666f6f66565f6f5ff565f65f3f6553f5f5f5555f55
043444390904343439040909040904340434545455954394943434093f9ff3ff5945f5fff5ff505055555f556565f5f6f5f565f3f5f565f5f5f55f55565f55f5
4440444090444404540905554340404094439495955495f4344444954f67f77f3434ff6ffffff000555555f5f5f56565565f565f5655f55f565f555f5f55f555
4343434543543404343440904043434034455345443454a4943435593f777f7f59453f737f3ff0500555555565655f555555f56555555f5555565555555555f5
4444044344444434400434045440440445934944344f4f59534449595ff7f67ff5f5ff7f77f60d500455555555f605555555565555555555f555555555555555
043404443509044344440434034055904544559443434ff949343434ff737f7f34936f77f675515004343443955f55ffffff56455f5fff456f0555555456f555
44439040904090904340904090434043443439554434f43454454495a6f777fff454f73f7ff6050005545f39ff355f73f7f35555ffa5a6f5555434f5f553f554
40440909095434545440409040444344344450550550534f9394345f56f7f7674f35f7f376f505000543ff43ff5f77fff77ff5ff5ff6ffff43f4f43f5f455454
34043443409045434309090434340904434306dd6dd650554543ff395ff3f7f73f95ff7f7f75560005543f4af555f7f77ff555f3fffff3f65f5f3f4f346f5f34
0909044345545444444340904434543545555c66666660343f5f345f3f7f37ff4ff5f7f63ff50550005ff345ffff7ff3f7ff3fff43ff7ff343f45595f5f405f3
4090909409090904340454340440954434505d6666665555553ff5f5fff7ff777ff4f375f0434550055fff393ffffffff3ff4f35f4fff7ff4f53435f553f4545
54345409043454344509045443450954555050050050055055ffa3f5ff5f36f66755fff5344345454393af95f53f343fff5f344343f3ff343f45f5455455a554
4044349043443444340434045409554340355050000100055af3ff5035ff5ff667f5f555f044000004faf3f6ffffffffff3fff55f4fffff345554354343f555f
05344040454044044540443409034045450505050505050057fa3a405f3f555665643f056055003f5555f5f36667366667f6f7f777777f7ffff5ffffff5ff555
504343443409090909054340340409090555050010000005343f55030455f5f655655f50f0500455504505055055555555555355353535653653f5365f6f3fff
6004090404340904343409090443404340550531351555055f5450455543555ff5f554555555055f503405404504050505504504040455555550550500505050
6545409045409090440405409034540453430000000001035f3550050554ff445465434595005455500554305340554555055055555050404054055550504005
5043443409434543454344304409043444555505000111045434504030553f9ff34344343f455459545934405505005055555555055555555555040555505550
0540404555405444090409543440409054340000050111543550505040344fa4f4f9544545a5439fafa443000000000000000000000005005055555540450455
00003400404439095404345403434054545450500001105443055050400555f49343939395f9fff595af9f9f5943454554050500500000000000000000000000
05000050090404043434434090404343434345000500055535543453550544345444594f9ffff3faff95aff9fff9faff9ff9f9ff495f59545555504000050000
050404500434390909045a45590404544454555550555556565434545434345434345555593fff6ff695434593fff3ff5affff4afafaffaf9f99f9f9f9f9ff4f
05500050540440445409055430005505000000343455555555555535554543454545959f43f495f93fffff6f6f53f5f3f553f3f5f4f3fff5ff34a5af5f554a9f
05043040009093443455459459000500505050545450450000055444343f34f34343f53ff4f5f3ff43f36f55f77f77ffffffffff3fff3fff34f55534553f5534
5550400349090443440459534505005050505050340500405505430444af9595a7f439ffa3afa4f3ff5ffff3f677676f3f555f3ff5fff6f6f65fff55345ff9ff
4550404004594a494959549f5555505000500040034055555550540354f595affafff4494fa3aafa4aff3f45f53ffffffffffff6ff6f5f5f5f355fff555ffff9
5550504054a595939394954555650005040505554055043055550444439f44393ffffaf39f939393939f94944fffaff395954545455ff3ff66f7776676f3ff3f
43404305054f9f9f949344445f5549494a950005004300403555300544f394a4f3ff694934f4afaf93f9344935fafaf9f93a4a4a493494a450555355f5ffffff
55540094a9af4a4f4a5940440444093400000550404050505050405434f45434aa3a4f4944a5a5939ff4944544afffaffaffff3fffaffaf55555f55f55439afa
5434959f595a59f9594440404390000444495054305040500550045495a444f309439343434fff4f4a49094955fa9faffffa7af7afffffa43456f7f34345544f
9595a4949f49f439f4540404400004439004a0040405540040959393944345943939490994934449349594305afff95afaffffa7fa7afaf9555f767f596ff3f9
9f9f4f939f43994934404400494040400500540450450450043444443499459434a44404f493955a934494955555af9f9fafaffaffaf9faf5536767555f6ffff
44394a549594434440040040405040000440405340400040549439094495944a99394f4a93f95a9340404904553455ff3fafffafafffff5554553f7f34f5ffff
949549594939493940040400404004440004040459344054304440540f9094439934444f49f9595944900a454545404045545555454554555554556ff5fff5f3
4349595954495944040404040404000044040409439439094430344344a4a343959344ff9f449f443404454355a04040400404040434555043435555fff3ff54
93443443943459394400404004040404004004309434450305400944454594a09343934f4f4f4a494445a444559440904345404340904435555595f3f5ff6fff
443944344949544434454044040404004040490934434054434593409599343994390995944395f3443945434393955444404044040943440455534555554355
54543443434593490959493495944444444909344090450000a593954344943939395a445f94a4934495945454fffa939090504044444094043545555555404f
054045540434043434343443434343934395944343043005454344344959309434349595af5a4344439454345a9a4ffafa390404004449439054343434535055
0050040504034040400455544043445945909040440454000493443459044394444593444f5f943444394400455939fa49f93944400449959454355455545054
050403040500040504050403040403403435543454050040404434494404340933445954f44504444a44304550545f39fa4af9f344494940f556545345555055
455504040404304050505004050505050043404090904500344445459439440494395540904434344394950555050459f9fafa9999494945a95f555543455045
04050503055004034040540504040540550009093405004544009443434f593959490405040049095954300555000555994999499999939afaf3f5343f7f5534
504040404504504055050504030505040545045045404004344434f94494444345a9040404040445959494454055555054445a44459944afafafff3ff777f777
543043050430043054090543404043055050404434043054a343449544540459094404094a4394394343454344455050555454534a93a9a9aa9f777777777777
004005040045040505005000505004040453090409004003435a559343440004449934434390444f949404449344954505f343443aaaf3999aa7777777777777
09055043040505043404345434040503050403443454054343954909540055544950444944444093495443a39990593409544f559afaa49494f7777777777777
0040400403404504050040500503404045550904405005440543590954055050459493434904549434934404339a449a4345545055ffa3999fff7777777f7777
4543404040550405090503404504034034055543440405343454909395505559495595004044045499349343994934a944f595f5555afa9f63f3f3fff6f37f7f
504043430904309050404430405040405045040434000404050434443450500594954439504544935959494433a9a49a95a45455050554ff77ff4f5f36f5f6f3
040340045043405434340540340430434550455400450003000040300040505950439093440434594a4a34399a39a9a49fffa454555551556fff3f5fff5f55f5
5540450434009040040540404304040505550904430450400500404040050003404540593440954343499a439f93444a4fafffff545551105f3f4343ff7f3ff5
05434040404503455040345504050040404055340090040445454430054005500443434540045434049393939394939593ffaf9fffff45555f5f6f3f5f7f7f6f
4004043404344040909040540404504303404040454545090404340400505055004450350443444000004a494393494f49f43fffa4fffff55f55555635f6f3f6
40430405340403430304340343040500405090909534345393954430050050055555454044493400400045345404459593faf9f959f9f4f4395f555555565763
0405040045045045440504040450504054050345544095959593045440405500050500450094a404040504004045040449fffff9595939f94345f56dd5555555
3004005500400405034434043040450340540909093434543459595f5454455050525409543455554595454040040540af99a9fafaf9f939f45450556655d55d
0500400450403040400005004530404050050434554443459544345954434f50500050593f405543555543434f44594ff944444a4fafa4a4943454555565666f
404005000500400504340405004030404340504054034443459544344394434454444454954340545454545453434343f49499ffa45aff93f405055405565563
0355040405400405000030404004055004040400040050405043544544345959434559344344545543555555455455455454545439ffff9f90434555555665f6
4040050504055040405504030505404340534040505505040505055505455543444a54595959593454434345545545545343434f4559345f5450404555f56665
050404040304030504050404040030050400304045404505540450450504504035043455434545959594449349344345455454343455954345a4343455556566
40430503404040405040505550550450405404050504304040504304340304054050405554543454345934494494a49594a593944545554439f39595f5f55f54
05050400403050340304550455045050505034040504043050504040040405500405040050040504045595543f595f93f4ff4f3ff9395a595fffff3f434f5f5f
