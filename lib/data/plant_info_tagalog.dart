class PlantInfoTagalog {
  const PlantInfoTagalog({
    required this.description,
    required this.healthUses,
    required this.partsUsed,
    required this.precautions,
  });

  final String description;
  final List<String> healthUses;
  final List<String> partsUsed;
  final List<String> precautions;
}

const Map<String, PlantInfoTagalog> plantInfoTagalog = {
  'Akapulko': PlantInfoTagalog(
    description:
        'Ang akapulko ay isang tropikal na palumpong na kilala sa Pilipinas '
        'dahil sa tradisyonal na paggamit nito sa mga halamang-gamot, lalo na '
        'para sa ilang impeksiyon sa balat na dulot ng mga halamang-singaw.',
    healthUses: [
      'Tradisyonal na ginagamit para sa mga impeksiyon sa balat gaya ng buni.',
      'Tradisyonal na ipinapahid sa ilang makati o naiiritang bahagi ng balat.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Karaniwang panlabas lamang ang mga tradisyonal na paghahanda para sa mga kondisyon ng balat.',
      'Itigil ang paggamit kung mangati o mamula ang balat.',
      'Kumonsulta sa propesyonal sa kalusugan kung malubha o hindi nawawala ang problema sa balat.',
    ],
  ),
  'Aloe Vera': PlantInfoTagalog(
    description:
        'Ang aloe vera ay isang halamang makatas ang mga dahon. Karaniwang '
        'ginagamit ang malinaw na gel sa loob ng dahon sa mga tradisyonal at '
        'pampaganda na paghahanda.',
    healthUses: [
      'Tradisyonal na ginagamit ang gel sa loob ng dahon upang paginhawahin ang bahagyang iritasyon sa balat.',
      'Karaniwang sangkap sa mga produktong pampalambot at pang-alaga ng balat.',
    ],
    partsUsed: ['Gel mula sa dahon'],
    precautions: [
      'Huwag ipagkamali ang panloob na gel sa dilaw na dagta sa ilalim ng balat ng dahon.',
      'Huwag kainin ang mga paghahanda ng aloe maliban kung partikular itong inihanda para inumin.',
      'Itigil ang paggamit sa balat kung magkaroon ng iritasyon o reaksiyong alerhiya.',
    ],
  ),
  'Alugbati': PlantInfoTagalog(
    description:
        'Ang alugbati ay isang baging na madahon na karaniwang itinatanim at '
        'kinakain bilang gulay sa Pilipinas at iba pang tropikal na lugar.',
    healthUses: [
      'Nagbibigay ng hibla at sustansiya kapag kinakain bilang gulay.',
      'Tradisyonal na isinasama sa mga pagkain bilang masustansyang madahong gulay.',
    ],
    partsUsed: ['Dahon', 'Batang tangkay'],
    precautions: [
      'Hugasan nang mabuti bago kainin.',
      'Isama ito sa iba-ibang pagkain bilang bahagi ng balanseng diyeta.',
      'Humingi ng payo sa propesyonal bago gamitin bilang gamot sa halip na karaniwang pagkain.',
    ],
  ),
  'Ampalaya': PlantInfoTagalog(
    description:
        'Ang ampalaya ay isang gulay na malawakang itinatanim sa Pilipinas at '
        'ginagamit din sa ilang tradisyonal na halamang-gamot.',
    healthUses: [
      'Tradisyonal na isinasama sa mga halamang-gamot na may kaugnayan sa pamamahala ng asukal sa dugo.',
      'Karaniwang kinakain bilang gulay.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Kumonsulta muna sa propesyonal sa kalusugan bago ito gamitin bilang gamot kung umiinom ng pampababa ng asukal sa dugo.',
      'Maaaring magdulot ng suliranin sa panunaw ang sobrang pagkain nito.',
      'Huwag ipalit ang halamang-gamot sa iniresetang paggamot para sa diyabetis.',
    ],
  ),
  'Avocado': PlantInfoTagalog(
    description:
        'Ang abokado ay punong namumunga na itinatanim sa Pilipinas. Karaniwang '
        'kinakain ang bunga nito at naglalaman ito ng taba at iba pang sustansiya.',
    healthUses: [
      'Nagbibigay ng taba at sustansiya kapag kinakain ang bunga.',
      'Karaniwang isinasama sa balanseng diyeta.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Kumain lamang ng angkop na dami.',
      'Iwasan ito kung may kilalang alerhiya sa pagkain.',
      'Talakayin sa propesyonal sa kalusugan ang paggamit nito bilang halamang-gamot.',
    ],
  ),
  'Balanoy': PlantInfoTagalog(
    description:
        'Ang balanoy o basil ay isang mabangong halamang-gamot na ginagamit '
        'sa pagluluto at sa ilang tradisyonal na halamang-gamot.',
    healthUses: [
      'Karaniwang ginagamit bilang pampalasa sa pagkain.',
      'Tradisyonal na ginagamit sa mga paghahandang halamang-gamot para sa di-komportableng pakiramdam sa tiyan at katawan.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Gamitin pangunahin bilang pagkain maliban kung iba ang payo ng kwalipikadong propesyonal.',
      'Iwasan ang sobrang paggamit ng matapang o puro nitong paghahanda.',
      'Itigil ang paggamit kung magkaroon ng reaksiyong alerhiya.',
    ],
  ),
  'Balimbing': PlantInfoTagalog(
    description:
        'Ang balimbing o star fruit ay punong tropikal na namumunga at '
        'karaniwang itinatanim sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng sustansiya kapag kinakain bilang prutas.',
      'Tradisyonal na isinasama sa mga lokal na pagkain at halamang-gamot.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Iwasan ang balimbing kung may sakit sa bato, maliban kung pinayagan ng propesyonal sa kalusugan.',
      'Huwag kumain nang sobra.',
      'Humingi ng payo sa propesyonal bago gamitin bilang halamang-gamot.',
    ],
  ),
  'Banaba': PlantInfoTagalog(
    description:
        'Ang banaba ay isang namumulaklak na puno sa Pilipinas. Tradisyonal '
        'itong ginagamit sa mga halamang-gamot, lalo na ang mga dahon nito.',
    healthUses: [
      'Tradisyonal na ginagamit sa mga halamang-gamot na may kaugnayan sa pamamahala ng asukal sa dugo.',
      'Karaniwang ginagamit ang mga dahon sa mga tradisyonal na paghahanda.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Kumonsulta sa propesyonal sa kalusugan bago gamitin kung umiinom ng gamot para sa diyabetis.',
      'Huwag ipalit ang halamang-gamot sa iniresetang paggamot para sa diyabetis.',
      'Gumamit lamang ng halamang wastong natukoy.',
    ],
  ),
  'Banana': PlantInfoTagalog(
    description:
        'Ang saging ay isa sa pinakamalawak na itinatanim na tropikal na '
        'pananim na prutas at karaniwang kinakain sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng carbohydrates at iba pang sustansiya.',
      'May hibla at mineral kapag kinakain bilang bahagi ng balanseng diyeta.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Isama ito sa balanseng diyeta.',
      'Sundin ang payo ng propesyonal kung may partikular na limitasyon sa pagkain.',
      'Mag-ingat sa paggamit bilang gamot ng ibang bahagi ng puno ng saging.',
    ],
  ),
  'Bayabas': PlantInfoTagalog(
    description:
        'Ang bayabas ay karaniwang punong namumunga sa Pilipinas. Matagal nang '
        'ginagamit ang mga dahon nito sa tradisyonal na halamang-gamot ng mga Pilipino.',
    healthUses: [
      'Tradisyonal na ginagamit sa mga paghahandang pangangalaga ng bibig at kalinisan.',
      'Nagbibigay ng bitamina C at iba pang sustansiya ang bunga ng bayabas.',
      'Tradisyonal na ginagamit ang mga paghahanda mula sa dahon sa paghuhugas ng ilang bahagyang problema sa balat.',
    ],
    partsUsed: ['Dahon', 'Bunga', 'Balat ng puno'],
    precautions: [
      'Gumamit ng halamang wastong inihanda.',
      'Magpatingin sa propesyonal kung hindi gumagaling ang sugat o impeksiyon.',
      'Huwag ipalit ang tradisyonal na paghahanda sa paggamot ng malubhang impeksiyon.',
    ],
  ),
  'Bignay': PlantInfoTagalog(
    description:
        'Ang bignay ay tropikal na punong namumunga na matatagpuan sa '
        'Pilipinas. Karaniwang kinakain ang maliliit na bunga nito kapag hinog na.',
    healthUses: [
      'Nagbibigay ng sustansiya at mga sangkap ng halaman kapag kinakain bilang prutas.',
      'Tradisyonal na ginagamit sa ilang lokal na pagkain at halamang-gamot.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Kumain lamang ng hinog na bunga at sa angkop na dami.',
      'Iwasan ang halamang hindi tiyak ang pagkakakilanlan o hindi wastong naihanda.',
      'Humingi ng payo sa propesyonal bago gamitin bilang gamot.',
    ],
  ),
  'Cacao': PlantInfoTagalog(
    description:
        'Ang cacao ay tropikal na punong itinatanim para sa mga buto nito na '
        'pinoproseso upang gawing kakaw at tsokolate.',
    healthUses: [
      'Maaaring magbigay ang mga produktong cacao ng likas na sangkap mula sa halaman.',
      'Maaaring magbigay ng antioxidant ang mga produktong kakaw kapag kinain sa angkop na dami.',
    ],
    partsUsed: ['Buto'],
    precautions: [
      'Maaaring mataas sa asukal at taba ang mga naprosesong produktong tsokolate.',
      'Bawasan ang pagkain nito kung sensitibo sa caffeine o mga pampasigla.',
      'Ituring ito bilang pagkain, hindi pamalit sa medikal na paggamot.',
    ],
  ),
  'Calamansi': PlantInfoTagalog(
    description:
        'Ang calamansi ay maliit na citrus na malawakang itinatanim sa '
        'Pilipinas at ginagamit sa inumin, pagluluto, at tradisyonal na paghahanda.',
    healthUses: [
      'Nagbibigay ng bitamina C at iba pang sustansiya.',
      'Karaniwang ginagamit pampalasa ng citrus at sangkap sa inumin.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Maaaring makairita sa sensitibong sikmura o ngipin ang maasim na katas.',
      'Huwag ipahid ang purong katas ng citrus sa naiiritang balat.',
      'Isama ito sa balanseng diyeta.',
    ],
  ),
  'Dalandan': PlantInfoTagalog(
    description:
        'Ang dalandan ay citrus na karaniwang kinakain sa Pilipinas at '
        'ginagamit sa mga katas at paghahanda ng pagkain.',
    healthUses: [
      'Nagbibigay ng bitamina C at iba pang sustansiya.',
      'Karaniwang kinakain nang sariwa o iniinom bilang katas.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Maaaring makairita sa sensitibong ngipin o sikmura ang maasim na katas.',
      'Hugasan ang bunga bago ihanda.',
      'Kumain o uminom lamang ng angkop na dami.',
    ],
  ),
  'Duhat': PlantInfoTagalog(
    description:
        'Ang duhat ay tropikal na punong namumunga. Karaniwang sariwang '
        'kinakain sa Pilipinas ang kulay-ube nitong bunga.',
    healthUses: [
      'Nagbibigay ang bunga ng sustansiya at mga sangkap ng halaman.',
      'Tradisyonal na ginagamit sa ilang lokal na halamang-gamot.',
    ],
    partsUsed: ['Bunga', 'Buto', 'Dahon'],
    precautions: [
      'Kumain lamang ng hinog na bunga at sa angkop na dami.',
      'Humingi muna ng payo sa propesyonal bago gumamit ng puro o matapang na paghahanda kung umiinom ng gamot para sa asukal sa dugo.',
      'Huwag umasa sa tradisyonal na paghahanda bilang paggamot sa mga karamdaman.',
    ],
  ),
  'Gumamela': PlantInfoTagalog(
    description:
        'Ang gumamela ay karaniwang palumpong na namumulaklak at itinatanim '
        'bilang palamuti sa Pilipinas. Ginagamit din ito sa ilang tradisyonal '
        'na halamang-gamot.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang paghahanda para sa bahagyang pangangalaga ng balat at buhok.',
      'Karaniwang ginagamit ang mga bulaklak sa mga tradisyonal na paghahanda.',
    ],
    partsUsed: ['Bulaklak', 'Dahon'],
    precautions: [
      'Gumamit lamang ng halamang wastong natukoy.',
      'Huwag inumin ang puro o matapang na paghahanda maliban kung ipinayo ng propesyonal.',
      'Itigil ang paggamit kung magkaroon ng iritasyon o reaksiyong alerhiya.',
    ],
  ),
  'Guyabano': PlantInfoTagalog(
    description:
        'Ang guyabano o soursop ay tropikal na punong namumunga na karaniwang '
        'itinatanim sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng sustansiya ang bunga kapag kinakain bilang pagkain.',
      'Tradisyonal na ginagamit sa ilang lokal na halamang-gamot.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Kainin ang bunga bilang pagkain sa halip na umasa sa puro o matapang na paghahanda mula sa dahon.',
      'Talakayin sa propesyonal sa kalusugan ang kaligtasan ng mga puro o matapang na paghahanda.',
      'Huwag gamitin bilang pamalit sa paggamot sa kanser o iba pang karamdaman.',
    ],
  ),
  'Ikmo': PlantInfoTagalog(
    description:
        'Ang ikmo o dahon ng betel ay tropikal na baging na tradisyonal na '
        'ginagamit sa iba’t ibang kaugaliang pangkultura sa Pilipinas at '
        'Timog-Silangang Asya.',
    healthUses: [
      'Tradisyonal na ginagamit ang mga dahon sa panlabas at pangbahay na halamang-gamot.',
      'Matagal nang bahagi ng mga lokal na kaugalian at tradisyon.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Iwasang nguyain ang mga halo na may tabako o bunga ng areca dahil kaugnay ang mga ito sa malubhang panganib sa kalusugan.',
      'Gumamit ng dahong wastong natukoy at malinis.',
      'Kumonsulta sa propesyonal sa kalusugan bago gamitin bilang gamot.',
    ],
  ),
  'Ipil-Ipil': PlantInfoTagalog(
    description:
        'Ang ipil-ipil ay mabilis lumaking tropikal na puno na karaniwan sa '
        'Pilipinas. Ginagamit ito bilang pagkain, kumpay, panggatong, at sa '
        'iba pang paraan.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang pamayanan ang mga murang dahon at buto.',
      'Pangunahing pinahahalagahan ito para sa agrikultura at ekolohiya.',
    ],
    partsUsed: ['Murang dahon', 'Buto'],
    precautions: [
      'Hindi inirerekomenda ang hilaw o labis na pagkain ng mga buto at dahon.',
      'Maaaring makasama ang ilang sangkap ng halaman kapag naparami.',
      'Huwag gamitin bilang gamot nang walang angkop na gabay ng propesyonal.',
    ],
  ),
  'Kakawate': PlantInfoTagalog(
    description:
        'Ang kakawate ay tropikal na puno na karaniwang itinatanim sa '
        'Pilipinas bilang bakod, pampaganda ng lupa, at para sa iba pang '
        'gamit sa agrikultura.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang pamayanan sa mga panlabas na paghahandang mula sa halaman.',
      'Pangunahing pinahahalagahan para sa agrikultura at kapaligiran.',
    ],
    partsUsed: ['Dahon', 'Balat ng puno'],
    precautions: [
      'Huwag inumin ang mga paghahanda ng kakawate na hindi napatunayang ligtas.',
      'Maaaring makairita o makalason ang halaman kapag hindi wastong ginamit.',
      'Gamitin lamang sa layuning panggamot sa ilalim ng angkop na gabay ng propesyonal.',
    ],
  ),
  'Kalachuchi': PlantInfoTagalog(
    description:
        'Ang kalachuchi ay namumulaklak na punong ornamental na karaniwang '
        'itinatanim sa mga hardin at tanawin sa Pilipinas.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang lokal na panlabas na halamang-gamot.',
      'Pangunahing pinahahalagahan bilang halamang palamuti.',
    ],
    partsUsed: ['Bulaklak', 'Dahon'],
    precautions: [
      'Maaaring makairita sa balat at mata ang maputing dagta nito.',
      'Huwag kainin ang mga bahagi ng halaman nang walang gabay ng propesyonal.',
      'Ilayo ang halaman sa mga bata at alagang hayop.',
    ],
  ),
  'Kamantigi': PlantInfoTagalog(
    description:
        'Ang kamantigi ay namumulaklak na halamang karaniwang itinatanim '
        'bilang palamuti sa mga tropikal na lugar, kabilang ang Pilipinas.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang pamayanan sa mga panlabas na halamang-gamot.',
      'Karaniwang itinatanim dahil sa mga bulaklak nito.',
    ],
    partsUsed: ['Dahon', 'Bulaklak'],
    precautions: [
      'Gumamit lamang ng halamang wastong natukoy.',
      'Huwag inumin ang puro o matapang na paghahanda nang walang payo ng propesyonal.',
      'Itigil ang paggamit sa balat kung magkaroon ng iritasyon.',
    ],
  ),
  'Kamantigue': PlantInfoTagalog(
    description:
        'Ang kamantigue ay karaniwang pangalang Pilipino para sa '
        'namumulaklak na halamang ornamental na Impatiens balsamina.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang lokal na panlabas na paghahanda.',
      'Pangunahing itinatanim bilang halamang ornamental na namumulaklak.',
    ],
    partsUsed: ['Dahon', 'Bulaklak'],
    precautions: [
      'Gumamit lamang ng halamang wastong natukoy.',
      'Huwag inumin ang puro o matapang na paghahanda nang walang payo ng propesyonal.',
      'Itigil ang paggamit kung magkaroon ng iritasyon sa balat.',
    ],
  ),
  'Kamias': PlantInfoTagalog(
    description:
        'Ang kamias ay tropikal na punong namumunga na karaniwang itinatanim '
        'sa mga bakuran sa Pilipinas at ginagamit sa pagluluto.',
    healthUses: [
      'Nagbibigay ng sustansiya at mga sangkap ng halaman kapag kinakain.',
      'Tradisyonal na ginagamit sa lokal na pagkain at mga paghahanda sa bahay.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Maasim ang bunga at maaaring makairita sa sikmura o ngipin.',
      'Iwasan ang sobrang pagkain nito kung may problema sa bato.',
      'Kumain lamang ng angkop na dami.',
    ],
  ),
  'Kamote': PlantInfoTagalog(
    description:
        'Ang kamote ay mahalagang pananim na pagkain sa Pilipinas. Karaniwang '
        'kinakain ang ugat at mga dahon nito.',
    healthUses: [
      'Nagbibigay ng carbohydrates, hibla, bitamina, at mineral.',
      'Maaaring kainin ang mga dahon bilang masustansyang gulay.',
    ],
    partsUsed: ['Ugat na tuber', 'Dahon'],
    precautions: [
      'Lutuin nang maayos bago kainin.',
      'Isama ito sa balanseng diyeta.',
      'Sundin ang payo ng propesyonal kung may partikular na limitasyon sa pagkain.',
    ],
  ),
  'Kamoteng kahoy': PlantInfoTagalog(
    description:
        'Ang kamoteng kahoy o cassava ay mahalagang tropikal na pananim-ugat '
        'na itinatanim at kinakain sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng carbohydrates at enerhiya kapag naihanda nang wasto.',
      'Maaaring kainin ang dahon bilang gulay kapag naproseso nang wasto.',
    ],
    partsUsed: ['Ugat', 'Dahon'],
    precautions: [
      'May likas na cyanogenic na sangkap ang hilaw na kamoteng kahoy kaya dapat itong iproseso at lutuin nang wasto.',
      'Huwag kumain ng hilaw na kamoteng kahoy.',
      'Sundin ang ligtas na paraan ng paghahanda ng pagkain.',
    ],
  ),
  'Kangkong': PlantInfoTagalog(
    description:
        'Ang kangkong ay madahong gulay na malawakang kinakain sa Pilipinas '
        'at iba pang tropikal na bansa.',
    healthUses: [
      'Nagbibigay ng hibla at sustansiya.',
      'Karaniwang kinakain bilang lutong madahong gulay.',
    ],
    partsUsed: ['Dahon', 'Batang tangkay'],
    precautions: [
      'Hugasan nang mabuti at lutuin nang wasto.',
      'Huwag mamitas mula sa maruming daluyan ng tubig.',
      'Isama ito sa balanseng diyeta.',
    ],
  ),
  'Katakataka': PlantInfoTagalog(
    description:
        'Ang katakataka ay halamang makatas ang mga dahon na karaniwang '
        'itinatanim sa mga tahanan sa Pilipinas at ginagamit sa tradisyonal '
        'na halamang-gamot.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang pamayanan para sa panlabas na paghahanda.',
      'Tradisyonal na ginagamit ang mga dahon para sa bahagyang problema sa balat.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Iwasang kainin ang marami o puro/matapang na paghahanda nito.',
      'Gumamit lamang ng halamang wastong natukoy.',
      'Kumonsulta sa propesyonal sa kalusugan bago gamitin bilang gamot.',
    ],
  ),
  'Katuray': PlantInfoTagalog(
    description:
        'Ang katuray ay maliit na tropikal na puno. Karaniwang kinakain sa '
        'Pilipinas ang mga bulaklak at murang bahagi nito.',
    healthUses: [
      'Nagbibigay ng sustansiya ang mga bulaklak at murang dahon kapag inihanda nang wasto bilang pagkain.',
      'Tradisyonal na isinasama sa mga lokal na pagkain.',
    ],
    partsUsed: ['Bulaklak', 'Murang dahon'],
    precautions: [
      'Hugasan at lutuin nang maayos bago kainin.',
      'Kainin bilang pagkain sa halip na umasa rito bilang lunas.',
      'Iwasan ang mga bahaging hindi tiyak ang pagkakakilanlan.',
    ],
  ),
  'Lagundi': PlantInfoTagalog(
    description:
        'Ang lagundi ay halamang-gamot sa Pilipinas na tradisyonal na '
        'ginagamit sa mga paghahanda, lalo na para sa hirap sa paghinga.',
    healthUses: [
      'Tradisyonal na ginagamit para sa ubo at di-komportableng pakiramdam sa paghinga.',
      'Karaniwang ginagamit ang mga dahon sa mga halamang-gamot sa Pilipinas.',
    ],
    partsUsed: ['Dahon', 'Bulaklak'],
    precautions: [
      'Huwag ipalit sa propesyonal na medikal na paggamot.',
      'Kumonsulta sa propesyonal sa kalusugan kung nagpapatuloy o lumalala ang sintomas sa paghinga.',
      'Gumamit ng halamang wastong inihanda.',
    ],
  ),
  'Luya': PlantInfoTagalog(
    description:
        'Malawakang ginagamit ang luya sa pagluluto at tradisyonal na '
        'halamang-gamot ng mga Pilipino.',
    healthUses: [
      'Tradisyonal na ginagamit para sa di-komportableng pakiramdam sa panunaw.',
      'Karaniwang inihahanda bilang inuming halamang-gamot.',
      'Karaniwang ginagamit na pampalasa sa pagkain.',
    ],
    partsUsed: ['Rizoma o ugat sa ilalim ng lupa'],
    precautions: [
      'Gamitin sa angkop na dami bilang pagkain o tradisyonal na paghahanda.',
      'Maaaring magdulot ng di-komportableng pakiramdam sa panunaw ang maraming luya.',
      'Kumonsulta sa propesyonal sa kalusugan kung gagamitin para sa isang kondisyon.',
    ],
  ),
  'Malunggay': PlantInfoTagalog(
    description:
        'Ang malunggay ay karaniwang itinatanim sa Pilipinas. Tradisyonal na '
        'ginagamit ang mga dahon nito bilang pagkain at sa mga halamang-gamot.',
    healthUses: [
      'Tradisyonal na kinakain bilang masustansyang madahong gulay.',
      'Naglalaman ng iba’t ibang bitamina, mineral, at iba pang sustansiya ng halaman.',
      'Karaniwang isinasama sa mga sabaw at iba pang pagkaing Pilipino.',
    ],
    partsUsed: ['Dahon', 'Supot ng buto (pods)'],
    precautions: [
      'Gamitin sa angkop na dami bilang pagkain o tradisyonal na halamang-gamot.',
      'Kumonsulta sa kwalipikadong propesyonal sa kalusugan para sa mga medikal na alalahanin.',
      'Huwag ipalit ang puro o matapang na paghahanda sa iniresetang paggamot.',
    ],
  ),
  'Mangga': PlantInfoTagalog(
    description:
        'Ang mangga ay isa sa mga pinakakilalang tropikal na punong '
        'namumunga sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng bitamina, hibla, at iba pang sustansiya ang bunga ng mangga.',
      'Karaniwang kinakain nang sariwa o isinasama sa mga pagkain.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Kumain lamang ng angkop na dami ng bunga.',
      'Iwasan ito kung may alerhiya sa prutas.',
      'Talakayin sa propesyonal ang tradisyonal na paggamit ng dahon bilang gamot.',
    ],
  ),
  'Mani': PlantInfoTagalog(
    description:
        'Ang mani ay mahalagang pananim na pagkain na karaniwang kinakain '
        'sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng protina at taba sa pagkain.',
      'May ilang bitamina at mineral kapag kinakain bilang bahagi ng balanseng diyeta.',
    ],
    partsUsed: ['Buto'],
    precautions: [
      'Maaaring magdulot ng malubhang reaksiyong alerhiya ang mani sa mga sensitibong tao.',
      'Kumain lamang ng produktong wastong itinago at inihanda.',
      'Iwasan ang bulok o inaamag na mani.',
    ],
  ),
  'Niyog-niyogan': PlantInfoTagalog(
    description:
        'Ang niyog-niyogan ay tropikal na baging na kinikilala sa tradisyonal '
        'na halamang-gamot sa Pilipinas.',
    healthUses: [
      'Tradisyonal na ginagamit sa mga paghahandang may kaugnayan sa bulate sa bituka.',
      'Tradisyonal na ginagamit ang hinog at pinatuyong buto.',
    ],
    partsUsed: ['Hinog na buto'],
    precautions: [
      'Gamitin lamang sa ilalim ng angkop na gabay ng propesyonal.',
      'Huwag magbigay ng halamang-gamot sa maliliit na bata nang walang payo ng propesyonal.',
      'Huwag lumampas sa dami ng tradisyonal na paghahandang inirerekomenda.',
    ],
  ),
  'Oregano': PlantInfoTagalog(
    description:
        'Ang oregano ay mabangong halamang-gamot na karaniwang itinatanim '
        'sa mga tahanan sa Pilipinas at ginagamit sa pagluluto at tradisyonal '
        'na halamang-gamot.',
    healthUses: [
      'Tradisyonal na iniinom bilang halamang-gamot para sa ubo at hirap sa paghinga.',
      'Karaniwang ginagamit bilang pampalasa sa pagkain.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Gamitin sa karaniwang dami bilang pagkain maliban kung iba ang payo ng propesyonal.',
      'Maaaring makairita sa balat o panunaw ang puro o matapang na langis nito.',
      'Magpatingin sa propesyonal sa kalusugan kung nagpapatuloy ang sintomas sa paghinga.',
    ],
  ),
  'Pandan': PlantInfoTagalog(
    description:
        'Ang pandan ay mabangong tropikal na halaman na malawakang ginagamit '
        'sa pagluluto, panghimagas, at inumin sa Pilipinas.',
    healthUses: [
      'Karaniwang ginagamit pampalasa at pampabango ng pagkain.',
      'Tradisyonal na ginagamit sa ilang pangbahay na halamang-gamot.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Gumamit ng malinis na dahon na inihanda nang wasto para sa pagkain.',
      'Huwag ipagpalagay na nakagagamot ng sakit ang tradisyonal na paghahanda.',
      'Kumonsulta sa propesyonal bago gamitin bilang gamot.',
    ],
  ),
  'Panhauli': PlantInfoTagalog(
    description:
        'Ang panhauli ay mabangong halamang-gamot na karaniwang itinatanim '
        'sa mga tropikal na lugar at kilala sa makakapal at mababangong dahon.',
    healthUses: [
      'Tradisyonal na inihahanda sa bahay bilang halamang-gamot para sa ubo at sipon.',
      'Ginagamit din ang mga dahon bilang mabangong pampalasa sa pagkain.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Gumamit lamang ng katamtamang dami sa tradisyonal na paghahanda.',
      'Iwasan ang puro o matapang na paghahanda nang walang gabay ng propesyonal.',
      'Magpatingin kung nagpapatuloy ang sintomas sa paghinga.',
    ],
  ),
  'Pansit pansitan': PlantInfoTagalog(
    description:
        'Ang pansit-pansitan o ulasimang bato ay maliit na halamang-gamot na '
        'tradisyonal na ginagamit sa Pilipinas.',
    healthUses: [
      'Tradisyonal na ginagamit sa mga paghahandang may kaugnayan sa uric acid at pananakit ng kasu-kasuan.',
      'Maaaring kainin nang sariwa bilang gulay sa ilang tradisyonal na paraan.',
    ],
    partsUsed: ['Dahon', 'Tangkay'],
    precautions: [
      'Kumonsulta sa propesyonal sa kalusugan kung may kondisyon sa bato o gout.',
      'Huwag ipalit ang halamang-gamot sa iniresetang paggamot.',
      'Gumamit ng halamang wastong natukoy at malinis.',
    ],
  ),
  'Papaya': PlantInfoTagalog(
    description:
        'Ang papaya ay tropikal na punong namumunga na malawakang itinatanim '
        'sa Pilipinas at karaniwang kinakain.',
    healthUses: [
      'Nagbibigay ang hinog na bunga ng bitamina, hibla, at iba pang sustansiya.',
      'Karaniwang ginagamit sa pagluluto ng Pilipino ang hilaw na bunga.',
    ],
    partsUsed: ['Bunga', 'Dahon'],
    precautions: [
      'Kumain lamang ng bungang naihanda nang wasto.',
      'Kumonsulta sa propesyonal sa kalusugan bago gumamit ng puro o matapang na hilaw na papaya o dagta nito habang nagdadalang-tao.',
      'Huwag ipalit ang paghahanda ng papaya sa medikal na paggamot.',
    ],
  ),
  'Saluyot': PlantInfoTagalog(
    description:
        'Ang saluyot ay madahong gulay na malawakang kinakain sa Pilipinas '
        'at pinahahalagahan dahil nakakain ang mga dahon nito.',
    healthUses: [
      'Nagbibigay ng hibla at sustansiya.',
      'Karaniwang kinakain bilang nilutong madahong gulay.',
    ],
    partsUsed: ['Dahon', 'Murang usbong'],
    precautions: [
      'Hugasan at lutuin nang wasto bago kainin.',
      'Isama ito sa balanseng diyeta.',
      'Talakayin sa propesyonal ang paggamit bilang gamot bukod sa karaniwang pagkain.',
    ],
  ),
  'Sambong': PlantInfoTagalog(
    description:
        'Ang sambong ay tradisyonal na halamang-gamot sa Pilipinas na '
        'karaniwang ginagawang tsaa o iba pang halamang-gamot.',
    healthUses: [
      'Tradisyonal na ginagamit upang makatulong sa pag-ihi.',
      'Tradisyonal na ginagamit sa mga paghahandang may kaugnayan sa suliranin sa pag-ihi.',
      'Karaniwang ginagamit ang mga dahon sa mga halamang-gamot sa Pilipinas.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Kumonsulta sa propesyonal sa kalusugan kung may kondisyon sa bato o pag-ihi.',
      'Huwag ipalit ang halamang-gamot sa pagsusuri o iniresetang paggamot.',
      'Gumamit ng halamang wastong inihanda.',
    ],
  ),
  'Sampa Sampalokan': PlantInfoTagalog(
    description:
        'Ang Sampa Sampalokan ay lokal na pangalang iniuugnay sa sampalok, '
        'isang tropikal na punong ginagamit sa pagkain at pampalasa sa Pilipinas.',
    healthUses: [
      'Nagbibigay ang bunga ng sampalok ng hibla at iba pang sustansiya.',
      'Karaniwang ginagamit upang magdagdag ng asim sa mga pagkaing Pilipino at inumin.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Kumain lamang ng katamtamang dami bilang pagkain.',
      'Maaaring makairita sa sensitibong ngipin o sikmura ang mga pagkaing lubhang maasim.',
      'Humingi ng payo sa propesyonal bago gamitin bilang gamot.',
    ],
  ),
  'Sampa Sampalukan': PlantInfoTagalog(
    description:
        'Ang Sampa Sampalukan ay lokal na pangalang iniuugnay sa sampalok, '
        'na karaniwang sangkap sa pagkain at tradisyonal na halaman.',
    healthUses: [
      'Nagbibigay ang bunga ng hibla at sustansiya mula sa halaman.',
      'Karaniwang ginagamit na pampaasim sa mga pagkaing Pilipino.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Kumain lamang ng katamtamang dami bilang pagkain.',
      'Maaaring makairita sa sensitibong ngipin o sikmura ang maasim na paghahanda.',
      'Humingi ng payo sa propesyonal bago gamitin bilang gamot.',
    ],
  ),
  'Sampalok': PlantInfoTagalog(
    description:
        'Ang sampalok ay tropikal na punong malawakang ginagamit sa '
        'pagluluto ng Pilipino, lalo na bilang pampaasim.',
    healthUses: [
      'Nagbibigay ng hibla at sustansiya ang bunga kapag kinakain.',
      'Karaniwang sangkap sa pagkain at pampalasa ng inumin.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Kumain lamang ng angkop na dami bilang pagkain.',
      'Maaaring makairita sa sensitibong ngipin o sikmura ang maaasim na pagkain.',
      'Huwag ipalit ang puro o matapang na paghahanda sa medikal na pangangalaga.',
    ],
  ),
  'Siling Labuyo': PlantInfoTagalog(
    description:
        'Ang siling labuyo ay maliit at maanghang na sili na karaniwang '
        'ginagamit na pampalasa sa lutuing Pilipino.',
    healthUses: [
      'May capsaicin at iba pang sangkap mula sa halaman.',
      'Karaniwang ginagamit na pampalasa sa pagkain.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Maaaring magdulot ng hapdi o iritasyon kapag naparami.',
      'Iwasang maidampi sa mata at sensitibong balat matapos hawakan.',
      'Maaaring kailangang limitahan ang maanghang na pagkain kung sensitibo ang panunaw.',
    ],
  ),
  'Suha': PlantInfoTagalog(
    description:
        'Ang suha o pomelo ay malaking citrus na karaniwang itinatanim at '
        'kinakain sa Pilipinas.',
    healthUses: [
      'Nagbibigay ng bitamina C at hibla.',
      'Karaniwang kinakain bilang sariwang prutas.',
    ],
    partsUsed: ['Bunga'],
    precautions: [
      'Maaaring makipag-ugnayan ang suha sa ilang gamot. Magtanong sa propesyonal sa kalusugan bago kumain ng marami kung umiinom ng iniresetang gamot.',
      'Isama ito sa balanseng diyeta.',
      'Iwasan ito kung may alerhiya sa citrus.',
    ],
  ),
  'Tanglad': PlantInfoTagalog(
    description:
        'Ang tanglad ay mabangong damo na malawakang ginagamit sa lutuing '
        'Pilipino at sa mga tradisyonal na inuming halamang-gamot.',
    healthUses: [
      'Karaniwang ginagamit na pampalasa sa pagkain.',
      'Tradisyonal na inihahanda bilang mabangong tsaang halamang-gamot.',
    ],
    partsUsed: ['Dahon', 'Tangkay'],
    precautions: [
      'Gamitin sa daming karaniwan sa pagkain.',
      'Maaaring hindi angkop sa lahat ang puro o matapang na paghahanda.',
      'Kumonsulta sa propesyonal sa kalusugan bago gamitin bilang gamot habang nagdadalang-tao o kung may pangmatagalang kondisyon.',
    ],
  ),
  'Tawa tawa': PlantInfoTagalog(
    description:
        'Ang tawa-tawa ay maliit na halamang karaniwang tumutubo sa mga '
        'tropikal na lugar at kilala sa katutubong panggagamot sa Pilipinas.',
    healthUses: [
      'Tradisyonal na ginagamit sa ilang katutubong paghahanda sa Pilipinas.',
      'Matagal nang ginagamit sa tradisyon para sa iba’t ibang bahagyang karamdaman.',
    ],
    partsUsed: ['Buong halaman'],
    precautions: [
      'Hindi pinatutunayan ng tradisyonal na paggamit na kaya nitong gamutin ang malubhang sakit.',
      'Huwag ipalit sa medikal na pangangalaga, lalo na para sa dengue o pagdurugo.',
      'Kumonsulta sa propesyonal sa kalusugan bago gumamit bilang gamot.',
    ],
  ),
  'Tsaang Gubat': PlantInfoTagalog(
    description:
        'Ang tsaang gubat ay palumpong sa Pilipinas na tradisyonal na '
        'inihahandang tsaa at kinikilala sa halamang-gamot ng bansa.',
    healthUses: [
      'Tradisyonal na iniinom na tsaa para sa di-komportableng pakiramdam sa panunaw.',
      'Tradisyonal na ginagamit sa mga paghahandang may kaugnayan sa pagtatae at pananakit ng tiyan.',
      'Tradisyonal ding ginagamit ang mga dahon sa pangangalaga ng kalinisan ng bibig.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Magpatingin sa doktor kung nagpapatuloy ang pagtatae o matindi ang sakit ng tiyan.',
      'Gumamit ng dahong wastong natukoy at malinis.',
      'Huwag umasa sa tsaang halamang-gamot bilang pamalit sa medikal na paggamot.',
    ],
  ),
  'Turmeric Dulaw': PlantInfoTagalog(
    description:
        'Ang luyang dilaw o dulaw ay halamang may rizoma na malawakang '
        'ginagamit na pampalasa, pangkulay ng pagkain, at sangkap sa '
        'tradisyonal na halamang-gamot.',
    healthUses: [
      'Tradisyonal na ginagamit sa mga paghahanda para sa pangkalahatang kalusugan at panunaw.',
      'Naglalaman ng curcuminoids at iba pang likas na sangkap ng halaman.',
      'Karaniwang ginagamit na pampalasa sa pagkain.',
    ],
    partsUsed: ['Rizoma o ugat sa ilalim ng lupa'],
    precautions: [
      'Maaaring magdulot ng di-komportableng pakiramdam sa panunaw ang maraming luyang dilaw.',
      'Kumonsulta sa propesyonal sa kalusugan bago gumamit ng puro o matapang na paghahanda kung may kondisyon sa apdo o daluyan ng apdo.',
      'Mag-ingat sa paggamit ng puro o matapang na suplemento at katas.',
    ],
  ),
  'Yerba Buena': PlantInfoTagalog(
    description:
        'Ang yerba buena ay mabangong halamang kabilang sa pamilya ng mint '
        'na tradisyonal na ginagamit sa halamang-gamot sa Pilipinas.',
    healthUses: [
      'Tradisyonal na ginagamit bilang halamang-gamot para sa bahagyang pananakit at di-komportableng pakiramdam ng katawan.',
      'Tradisyonal na inihahanda bilang tsaa.',
      'Maaaring gamitin ang mga dahon sa ilang panlabas na paghahanda.',
    ],
    partsUsed: ['Dahon'],
    precautions: [
      'Gumamit ng dahong inihanda nang wasto.',
      'Huwag umasa sa halamang-gamot para sa matindi o nagpapatuloy na pananakit.',
      'Kumonsulta sa propesyonal sa kalusugan kung nagpapatuloy ang mga sintomas.',
    ],
  ),
};
