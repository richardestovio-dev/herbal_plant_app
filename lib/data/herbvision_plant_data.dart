import 'plant_info.dart';

const Map<String, PlantInfo> herbVisionPlantData = {
  // ============================================================
  // 0 — Akapulko
  // ============================================================

  'Akapulko': PlantInfo(
    commonName: 'Akapulko',
    scientificName: 'Senna alata',
    description: 'A tropical shrub commonly known as akapulko and traditionally used for certain skin conditions.',
    healthUses: [
      'PITAHC reports clinical evidence for antifungal and antiscabies applications.',
      'Traditionally used for ringworm and other fungal skin infections.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Avoid use if an allergic reaction occurs.',
      'Seek medical advice if the skin condition worsens or does not improve.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 1 — Aloe Vera
  // ============================================================
  'Aloe Vera': PlantInfo(
    commonName: 'Aloe Vera',
    scientificName: 'Aloe barbadensis Miller',
    description: 'A succulent plant commonly known as sabila and widely used in traditional and cosmetic preparations.',
    healthUses: [
      'The gel is traditionally used for topical skin applications.',
      'Different aloe preparations have different safety considerations.',
    ],
    partsUsed: ['Leaf gel'],
    precautions: [
      'Avoid confusing topical aloe gel with latex-containing preparations.',
      'Do not ingest aloe preparations without professional guidance.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 2 — Alugbati
  // ============================================================
  'Alugbati': PlantInfo(
    commonName: 'Alugbati',
    scientificName: 'Basella alba',
    description: 'A leafy climbing plant commonly known as alugbati or vine spinach and widely consumed as a vegetable.',
    healthUses: [
      'Commonly consumed as a food plant.',
      'The leaves provide dietary nutrients when included as part of a balanced diet.',
    ],
    partsUsed: ['Leaves', 'Young shoots'],
    precautions: [
      'Wash plant material properly before consumption.',
      'Traditional food use should not be interpreted as a substitute for medical treatment.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 3 — Ampalaya
  // ============================================================
  'Ampalaya': PlantInfo(
    commonName: 'Ampalaya',
    scientificName: 'Momordica charantia',
    description: 'A tropical vine commonly known as ampalaya and widely used as food and in Philippine traditional medicine.',
    healthUses: [
      'Traditionally used in relation to blood sugar management.',
      'PITAHC reports clinical and pre-clinical research concerning ampalaya and diabetes-related applications.',
    ],
    partsUsed: ['Leaves', 'Fruit'],
    precautions: [
      'People with diabetes should consult a health professional before using ampalaya for blood sugar management.',
      'It should not replace prescribed diabetes treatment.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 4 — Avocado
  // ============================================================
  'Avocado': PlantInfo(
    commonName: 'Avocado',
    scientificName: 'Persea americana',
    description: 'A tropical fruit tree cultivated for its edible fruit.',
    healthUses: [
      'The fruit is commonly consumed as food.',
      'Avocado provides dietary fats and other nutrients.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'People with known food allergies should exercise caution.',
      'Medicinal preparations should not replace professional medical treatment.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 5 — Balanoy
  // ============================================================
  'Balanoy': PlantInfo(
    commonName: 'Balanoy',
    scientificName: 'Ocimum basilicum',
    description: 'An aromatic herb commonly known as balanoy and widely used as a culinary plant.',
    healthUses: [
      'Traditionally used in herbal preparations.',
      'The plant has been investigated for several biological activities.',
    ],
    partsUsed: ['Leaves', 'Seeds'],
    precautions: [
      'Use medicinal preparations cautiously.',
      'Consult a health professional when using concentrated preparations.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 6 — Balimbing
  // ============================================================
  'Balimbing': PlantInfo(
    commonName: 'Balimbing',
    scientificName: 'Averrhoa carambola',
    description:
        'A tropical fruit tree commonly known as balimbing or star fruit.',
    healthUses: [
      'The fruit is commonly consumed as food.',
      'Traditional uses of the plant have been reported.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'People with kidney disease should seek professional medical advice before consuming large amounts of star fruit.',
      'Do not use plant preparations as a substitute for medical treatment.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 7 — Banaba
  // ============================================================
  'Banaba': PlantInfo(
    commonName: 'Banaba',
    scientificName: 'Lagerstroemia speciosa',
    description:
        'A flowering tree commonly known in the Philippines as banaba.',
    healthUses: [
      'Traditionally associated with herbal preparations for blood sugar-related concerns.',
      'Banaba has been investigated for biological and metabolic effects.',
    ],
    partsUsed: ['Leaves', 'Bark'],
    precautions: [
      'People taking medication for blood sugar should consult a health professional before using medicinal preparations.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 8 — Banana
  // ============================================================
  'Banana': PlantInfo(
    commonName: 'Banana',
    scientificName: 'Musa spp.',
    description:
        'A widely cultivated tropical plant valued for its edible fruit.',
    healthUses: [
      'The fruit is commonly consumed as food.',
      'Banana provides dietary carbohydrates, fiber, and other nutrients.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Wash and properly prepare edible plant parts before consumption.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 9 — Bayabas
  // ============================================================
  'Bayabas': PlantInfo(
    commonName: 'Bayabas',
    scientificName: 'Psidium guajava',
    description: 'A common Philippine fruit tree known as bayabas and widely used as food and in traditional herbal practices.',
    healthUses: [
      'PITAHC reports clinical evidence involving gingivitis and acute diarrhea.',
      'Traditionally used for certain skin, oral, and other conditions.',
    ],
    partsUsed: ['Leaves', 'Fruit', 'Bark'],
    precautions: [
      'Consult a health professional if symptoms persist.',
      'Do not replace prescribed treatment with herbal preparations.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 10 — Bignay
  // ============================================================
  'Bignay': PlantInfo(
    commonName: 'Bignay',
    scientificName: 'Antidesma bunius',
    description: 'A tropical tree commonly known as bignay and valued for its edible fruits.',
    healthUses: [
      'Traditionally used as food and in local herbal practices.',
      'The fruit contains naturally occurring plant compounds.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: ['Traditional use does not establish medical effectiveness.'],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 11 — Cacao
  // ============================================================
  'Cacao': PlantInfo(
    commonName: 'Cacao',
    scientificName: 'Theobroma cacao',
    description: 'A tropical tree cultivated for its seeds, which are processed to produce cocoa and chocolate products.',
    healthUses: [
      'Cacao products may be consumed as part of the diet.',
      'Cacao contains naturally occurring plant compounds.',
    ],
    partsUsed: ['Seeds', 'Fruit'],
    precautions: [
      'Cacao products may contain added sugar and other ingredients depending on preparation.',
      'Do not interpret food use as a medical treatment.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 12 — Calamansi
  // ============================================================
  'Calamansi': PlantInfo(
    commonName: 'Calamansi',
    scientificName: 'Citrus microcarpa',
    description: 'A small citrus tree commonly known as calamansi and widely used in Philippine cuisine.',
    healthUses: [
      'The fruit is commonly consumed as a source of vitamin C.',
      'Traditionally used in food and household preparations.',
    ],
    partsUsed: ['Fruit', 'Peel'],
    precautions: [
      'Citrus juice can cause skin irritation in some individuals.',
      'Avoid contact with the eyes.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 13 — Dalandan
  // ============================================================
  'Dalandan': PlantInfo(
    commonName: 'Dalandan',
    scientificName: 'Citrus sinensis',
    description: 'A citrus fruit tree widely cultivated for its edible and aromatic fruit.',
    healthUses: [
      'The fruit is a dietary source of vitamin C.',
      'Traditionally used in food and household preparations.',
    ],
    partsUsed: ['Fruit', 'Peel'],
    precautions: [
      'People with citrus allergies should avoid the plant or its products.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 14 — Duhat
  // ============================================================
  'Duhat': PlantInfo(
    commonName: 'Duhat',
    scientificName: 'Syzygium cumini',
    description: 'A tropical fruit tree commonly known as duhat or Java plum.',
    healthUses: [
      'The fruit is commonly consumed as food.',
      'Different parts of the plant have been investigated for biological properties.',
    ],
    partsUsed: ['Fruit', 'Leaves', 'Bark'],
    precautions: [
      'Consult a health professional before using concentrated preparations for medical purposes.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 15 — Gumamela
  // ============================================================
  'Gumamela': PlantInfo(
    commonName: 'Gumamela',
    scientificName: 'Hibiscus rosa-sinensis',
    description: 'A flowering ornamental plant commonly known as gumamela in the Philippines.',
    healthUses: [
      'Traditionally used in various herbal preparations.',
      'Traditional uses may vary among communities.',
    ],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Traditional use does not guarantee medical effectiveness.',
      'Consult a health professional before using herbal preparations for medical conditions.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 16 — Guyabano
  // ============================================================
  'Guyabano': PlantInfo(
    commonName: 'Guyabano',
    scientificName: 'Annona muricata',
    description: 'A tropical fruit tree commonly known as guyabano.',
    healthUses: [
      'Traditionally used as food and in herbal preparations.',
      'Different parts of the plant have been studied for biological activities.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Avoid making cancer-treatment claims based solely on laboratory studies.',
      'Consult a health professional before using concentrated preparations.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 17 — Ikmo
  // ============================================================
  'Ikmo': PlantInfo(
    commonName: 'Ikmo',
    scientificName: 'Piper betle',
    description: 'A climbing plant commonly known as ikmo or betel leaf.',
    healthUses: [
      'Traditionally used in various cultural and herbal practices.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Traditional use does not establish medical effectiveness.',
      'Consult a health professional before using medicinal preparations.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 18 — Ipil-Ipil
  // ============================================================
  'Ipil-Ipil': PlantInfo(
    commonName: 'Ipil-Ipil',
    scientificName: 'Leucaena leucocephala',
    description: 'A fast-growing leguminous tree commonly known as ipil-ipil.',
    healthUses: [
      'Used traditionally in some communities.',
      'The plant is also important for agricultural and environmental purposes.',
    ],
    partsUsed: ['Leaves', 'Seeds'],
    precautions: [
      'Do not consume medicinal preparations without professional guidance.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 19 — Kakawate
  // ============================================================
  'Kakawate': PlantInfo(
    commonName: 'Kakawate',
    scientificName: 'Gliricidia sepium',
    description: 'A fast-growing tree known locally as kakawate and commonly used as a living fence and shade tree.',
    healthUses: [
      'Reported in traditional practices for various applications.',
      'Its primary local uses also include agricultural and environmental purposes.',
    ],
    partsUsed: ['Leaves', 'Bark'],
    precautions: [
      'Do not ingest preparations without appropriate professional guidance.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 20 — Kalachuchi
  // ============================================================
  'Kalachuchi': PlantInfo(
    commonName: 'Kalachuchi',
    scientificName: 'Plumeria spp.',
    description: 'A flowering ornamental plant commonly known as kalachuchi or frangipani.',
    healthUses: ['Traditionally used in some local herbal practices.'],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Do not ingest plant preparations without professional guidance.',
      'Avoid contact with plant sap if irritation occurs.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 21 — Kamantigi
  // ============================================================
  'Kamantigi': PlantInfo(
    commonName: 'Kamantigi',
    scientificName: 'Impatiens balsamina',
    description:
        'A flowering herb commonly known in the Philippines as kamantigi.',
    healthUses: [
      'Traditionally used in various local herbal practices.',
      'Traditional applications vary between communities.',
    ],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Consult a health professional before using preparations medicinally.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 22 — Kamantigue
  // ============================================================
  'Kamantigue': PlantInfo(
    commonName: 'Kamantigue',
    scientificName: 'Impatiens balsamina',
    description:
        'A flowering herb commonly known in the Philippines as kamantigue.',
    healthUses: [
      'Traditionally used in various local herbal practices.',
      'Traditional applications vary between communities.',
    ],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Consult a health professional before using preparations medicinally.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 23 — Kamias
  // ============================================================
  'Kamias': PlantInfo(
    commonName: 'Kamias',
    scientificName: 'Averrhoa bilimbi',
    description: 'A tropical fruit tree commonly known as kamias.',
    healthUses: [
      'Traditionally used in food and herbal preparations.',
      'Traditional medicinal uses vary among communities.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'The fruit is acidic and may irritate sensitive individuals when consumed excessively.',
      'Use medicinal preparations cautiously.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 24 — Kamote
  // ============================================================
  'Kamote': PlantInfo(
    commonName: 'Kamote',
    scientificName: 'Ipomoea batatas',
    description:
        'A widely cultivated food crop commonly known as sweet potato.',
    healthUses: [
      'The tuberous roots and leaves are commonly consumed as food.',
      'Sweet potato provides dietary carbohydrates, fiber, vitamins, and minerals.',
    ],
    partsUsed: ['Tuberous root', 'Leaves'],
    precautions: ['Wash and properly prepare edible parts before consumption.'],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 25 — Kamoteng kahoy
  // ============================================================
  'Kamoteng kahoy': PlantInfo(
    commonName: 'Kamoteng kahoy',
    scientificName: 'Manihot esculenta',
    description: 'A tropical root crop commonly known as cassava.',
    healthUses: [
      'The properly processed root is an important food source.',
      'Leaves may also be consumed when properly prepared.',
    ],
    partsUsed: ['Tuberous root', 'Leaves'],
    precautions: [
      'Cassava must be properly processed and cooked because raw cassava contains cyanogenic compounds.',
      'Do not consume improperly prepared cassava.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 26 — Kangkong
  // ============================================================
  'Kangkong': PlantInfo(
    commonName: 'Kangkong',
    scientificName: 'Ipomoea aquatica',
    description: 'A leafy aquatic or semi-aquatic vegetable commonly consumed in the Philippines.',
    healthUses: [
      'The leaves and young shoots are commonly consumed as food.',
      'The plant provides dietary nutrients.',
    ],
    partsUsed: ['Leaves', 'Young shoots'],
    precautions: ['Wash and properly cook plant material before consumption.'],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 27 — Katakataka
  // ============================================================
  'Katakataka': PlantInfo(
    commonName: 'Katakataka',
    scientificName: 'Kalanchoe pinnata',
    description:
        'A succulent plant commonly known in the Philippines as katakataka.',
    healthUses: [
      'Traditionally used in various local herbal practices.',
      'Traditional applications should not be interpreted as proven medical treatments.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Consult a health professional before using medicinal preparations.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 28 — Katuray
  // ============================================================
  'Katuray': PlantInfo(
    commonName: 'Katuray',
    scientificName: 'Sesbania grandiflora',
    description:
        'A small tree commonly cultivated for its edible flowers and leaves.',
    healthUses: [
      'Flowers and other edible parts may be used as food when properly prepared.',
      'Traditional uses have been reported in local communities.',
    ],
    partsUsed: ['Flowers', 'Leaves'],
    precautions: [
      'Wash and properly prepare edible plant parts before consumption.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 29 — Lagundi
  // ============================================================
  'Lagundi': PlantInfo(
    commonName: 'Lagundi',
    scientificName: 'Vitex negundo',
    description: 'A medicinal shrub commonly known as lagundi and widely used in Philippine herbal medicine.',
    healthUses: [
      'PITAHC recognizes lagundi for cough and asthma-related applications.',
      'Lagundi has clinical and pre-clinical evidence in the Philippine setting.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Persistent cough, breathing difficulty, or asthma symptoms require professional medical attention.',
      'Do not discontinue prescribed medication without medical advice.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 30 — Luya
  // ============================================================
  'Luya': PlantInfo(
    commonName: 'Luya',
    scientificName: 'Zingiber officinale',
    description: 'A rhizomatous plant commonly known as ginger and widely used as a food spice.',
    healthUses: [
      'Traditionally used in food and herbal preparations.',
      'Ginger has been studied for several biological activities.',
    ],
    partsUsed: ['Rhizome'],
    precautions: [
      'Concentrated preparations may not be appropriate for everyone.',
      'Consult a health professional when using medicinal doses or when taking medication.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 31 — Malunggay
  // ============================================================
  'Malunggay': PlantInfo(
    commonName: 'Malunggay',
    scientificName: 'Moringa oleifera',
    description: 'A nutritious tree commonly known as malunggay and widely used as food in the Philippines.',
    healthUses: [
      'The leaves are commonly consumed as a nutritious vegetable.',
      'Moringa has been studied for several nutritional and biological properties.',
    ],
    partsUsed: ['Leaves', 'Pods', 'Seeds'],
    precautions: [
      'Use concentrated medicinal preparations cautiously.',
      'Consult a health professional when using supplements or preparations during pregnancy or while taking medication.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 32 — Mangga
  // ============================================================
  'Mangga': PlantInfo(
    commonName: 'Mangga',
    scientificName: 'Mangifera indica',
    description:
        'A widely cultivated tropical fruit tree known locally as mangga.',
    healthUses: [
      'The fruit is consumed as part of the diet.',
      'Different parts of the plant have been investigated for biological activities.',
    ],
    partsUsed: ['Fruit', 'Leaves', 'Bark'],
    precautions: [
      'People with mango or related plant allergies should exercise caution.',
      'Medicinal preparations should not replace medical treatment.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 33 — Mani
  // ============================================================
  'Mani': PlantInfo(
    commonName: 'Mani',
    scientificName: 'Arachis hypogaea',
    description:
        'A legume widely cultivated as a food crop and known locally as mani.',
    healthUses: [
      'Peanuts provide dietary protein and other nutrients.',
      'The plant has also been included in Philippine medicinal plant research.',
    ],
    partsUsed: ['Seeds'],
    precautions: [
      'People with peanut allergies must avoid peanut and peanut-containing products.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 34 — Niyog-niyogan
  // ============================================================
  'Niyog-niyogan': PlantInfo(
    commonName: 'Niyog-niyogan',
    scientificName: 'Quisqualis indica',
    description: 'A flowering climbing plant commonly known as niyog-niyogan.',
    healthUses: ['Traditionally used in Philippine herbal practices.'],
    partsUsed: ['Seeds', 'Leaves'],
    precautions: [
      'Do not use concentrated preparations without professional guidance.',
      'Traditional use does not guarantee medical effectiveness.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 35 — Oregano
  // ============================================================
  'Oregano': PlantInfo(
    commonName: 'Oregano',
    scientificName: 'Origanum vulgare',
    description: 'An aromatic herb commonly known as oregano and used as a culinary and traditional herbal plant.',
    healthUses: [
      'Traditionally used in herbal preparations.',
      'Oregano has been investigated for antimicrobial and antioxidant properties.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Concentrated herbal preparations may not be suitable for everyone.',
      'Consult a health professional when using medicinal doses.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 36 — Pandan
  // ============================================================
  'Pandan': PlantInfo(
    commonName: 'Pandan',
    scientificName: 'Pandanus amaryllifolius',
    description: 'An aromatic pandan plant widely used in Philippine cooking and traditional practices.',
    healthUses: [
      'Traditionally used in food and herbal preparations.',
      'Its leaves are primarily valued for their aromatic properties.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Use as food or traditional preparation rather than as a replacement for medical treatment.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 37 — Panhauli
  // ============================================================
  'Panhauli': PlantInfo(
    commonName: 'Panhauli',
    scientificName: 'Scientific identification not provided.',
    description: 'Plant information for this HerbVision class has not yet been added to the current plant information dataset.',
    healthUses: ['No health-related information has been added yet.'],
    partsUsed: ['Information not yet provided.'],
    precautions: [
      'Do not use this information as medical guidance.',
      'Consult a qualified health professional for medicinal use.',
    ],
    reference:
        'HerbVision plant dataset; detailed plant reference to be completed.',
  ),

  // ============================================================
  // 38 — Pansit pansitan
  // ============================================================
  'Pansit pansitan': PlantInfo(
    commonName: 'Pansit pansitan',
    scientificName: 'Peperomia pellucida',
    description: 'A small herb commonly known in the Philippines as pansit-pansitan or ulasimang bato.',
    healthUses: [
      'Traditionally used in Philippine herbal practices.',
      'PITAHC identifies ulasimang bato as one of the medicinal plants included in Philippine herbal medicine research.',
    ],
    partsUsed: ['Whole plant', 'Leaves'],
    precautions: [
      'Consult a health professional before using herbal preparations for a medical condition.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 39 — Papaya
  // ============================================================
  'Papaya': PlantInfo(
    commonName: 'Papaya',
    scientificName: 'Carica papaya',
    description: 'A tropical fruit plant widely cultivated and consumed in the Philippines.',
    healthUses: [
      'The fruit is commonly consumed as food.',
      'Different parts of the plant have been used traditionally.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Consult a health professional before using concentrated medicinal preparations.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 40 — Saluyot
  // ============================================================
  'Saluyot': PlantInfo(
    commonName: 'Saluyot',
    scientificName: 'Corchorus olitorius',
    description: 'A leafy plant known locally as saluyot and commonly used as a vegetable in the Philippines.',
    healthUses: [
      'Consumed as a food plant.',
      'Traditional uses of the plant have also been reported.',
    ],
    partsUsed: ['Leaves', 'Young shoots'],
    precautions: [
      'Wash plant material properly before consumption.',
      'People with specific medical conditions should consult a health professional before using herbal preparations.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 41 — Sambong
  // ============================================================
  'Sambong': PlantInfo(
    commonName: 'Sambong',
    scientificName: 'Blumea balsamifera',
    description: 'A Philippine medicinal plant commonly known as sambong.',
    healthUses: [
      'PITAHC reports clinical use as a diuretic and antiuricemic preparation.',
      'PITAHC also reports its use in relation to kidney stones.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Kidney stone symptoms require proper medical evaluation.',
      'Consult a health professional regarding preparation and dosage.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 42 — Sampa Sampalokan
  // ============================================================
  'Sampa Sampalokan': PlantInfo(
    commonName: 'Sampa Sampalokan',
    scientificName: 'Phyllanthus niruri',
    description: 'A small herb known locally as sampa-sampalokan and traditionally associated with herbal medicine.',
    healthUses: [
      'Traditionally used in herbal preparations for various ailments.',
      'Its traditional use should not be considered a substitute for medical treatment.',
    ],
    partsUsed: ['Whole plant'],
    precautions: [
      'Consult a health professional before using medicinal preparations.',
      'Do not use herbal preparations as a replacement for prescribed treatment.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 43 — Sampa Sampalukan
  // ============================================================
  'Sampa Sampalukan': PlantInfo(
    commonName: 'Sampa Sampalukan',
    scientificName: 'Phyllanthus niruri',
    description: 'A small herb associated with sampa-sampalokan and traditional herbal practices.',
    healthUses: [
      'Traditionally used in herbal preparations for various ailments.',
      'Its traditional use should not be considered a substitute for medical treatment.',
    ],
    partsUsed: ['Whole plant'],
    precautions: [
      'Consult a health professional before using medicinal preparations.',
      'Do not use herbal preparations as a replacement for prescribed treatment.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 44 — Sampalok
  // ============================================================
  'Sampalok': PlantInfo(
    commonName: 'Sampalok',
    scientificName: 'Tamarindus indica',
    description:
        'A tropical tree commonly known as sampalok and widely used as food.',
    healthUses: [
      'The fruit is commonly consumed as food.',
      'Traditional herbal uses have been reported for different parts of the plant.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Use medicinal preparations cautiously and consult a health professional when necessary.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 45 — Siling Labuyo
  // ============================================================
  'Siling Labuyo': PlantInfo(
    commonName: 'Siling Labuyo',
    scientificName: 'Capsicum frutescens',
    description: 'A pepper plant commonly known in the Philippines as siling labuyo and widely used as food.',
    healthUses: [
      'Traditionally used in various food and herbal preparations.',
      'Capsaicin and related compounds have been studied for biological activities.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'May cause irritation when consumed in large amounts or applied to sensitive skin.',
      'Avoid contact with the eyes.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 46 — Suha
  // ============================================================
  'Suha': PlantInfo(
    commonName: 'Suha',
    scientificName: 'Citrus maxima',
    description: 'A large citrus fruit tree commonly known as suha or pomelo.',
    healthUses: [
      'The fruit is consumed as food and provides dietary nutrients.',
      'Citrus fruits contain naturally occurring vitamins and plant compounds.',
    ],
    partsUsed: ['Fruit', 'Peel'],
    precautions: [
      'Citrus products may interact with some medicines; consult a health professional if taking medication regularly.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 47 — Tanglad
  // ============================================================
  'Tanglad': PlantInfo(
    commonName: 'Tanglad',
    scientificName: 'Cymbopogon citratus',
    description: 'An aromatic grass commonly known as lemongrass or tanglad and widely used in cooking.',
    healthUses: [
      'Traditionally used as a food and herbal ingredient.',
      'Lemongrass has been investigated for several biological properties.',
    ],
    partsUsed: ['Leaves', 'Stems'],
    precautions: [
      'Use concentrated preparations cautiously.',
      'Consult a health professional when using medicinal preparations.',
    ],
    reference: 'HerbVision plant dataset; plant information reference to be completed.',
  ),

  // ============================================================
  // 48 — Tawa tawa
  // ============================================================
  'Tawa tawa': PlantInfo(
    commonName: 'Tawa tawa',
    scientificName: 'Euphorbia hirta',
    description: 'A small herb known in the Philippines as tawa-tawa and traditionally used in herbal practices.',
    healthUses: [
      'Traditionally associated with respiratory and other herbal applications.',
      'Traditional use should not be interpreted as a proven treatment for asthma.',
    ],
    partsUsed: ['Whole plant'],
    precautions: [
      'Do not use this plant as a replacement for prescribed asthma medication.',
      'Seek medical attention for breathing difficulty or asthma symptoms.',
    ],
    reference: 'PhilMedic: Philippine Medicinal Plant Leaf Dataset (Mendeley Data, 2024).',
  ),

  // ============================================================
  // 49 — Tsaang Gubat
  // ============================================================
  'Tsaang Gubat': PlantInfo(
    commonName: 'Tsaang Gubat',
    scientificName: 'Carmona retusa',
    description: 'A shrub commonly known as tsaang-gubat and traditionally used in Philippine herbal medicine.',
    healthUses: [
      'PITAHC reports traditional use for stomach pains.',
      'PITAHC also reports clinical and pre-clinical research involving antispasmodic and caries-preventive applications.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'PITAHC does not recommend its traditional preparation for children below seven years old.',
      'Consult a doctor if symptoms persist.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),

  // ============================================================
  // 50 — Turmeric Dulaw
  // ============================================================
  'Turmeric Dulaw': PlantInfo(
    commonName: 'Turmeric Dulaw',
    scientificName: 'Curcuma longa',
    description: 'A rhizomatous plant commonly known as luyang dilaw and widely used as a culinary spice and in traditional practices.',
    healthUses: [
      'Traditionally used in herbal preparations.',
      'Curcumin, a compound found in turmeric, has been studied for several biological activities.',
    ],
    partsUsed: ['Rhizome'],
    precautions: [
      'High-dose or concentrated preparations may not be appropriate for everyone.',
      'Consult a health professional when using turmeric for a medical condition or together with medication.',
    ],
    reference: 'PhilMedic dataset; Philippine National Nutrition Council information on turmeric.',
  ),

  // ============================================================
  // 51 — Yerba Buena
  // ============================================================
  'Yerba Buena': PlantInfo(
    commonName: 'Yerba Buena',
    scientificName: 'Mentha cordifolia',
    description: 'The PhilMedic dataset identifies Mentha cordifolia as yerba buena and associates it with traditional Philippine herbal medicine.',
    healthUses: [
      'PITAHC identifies Mentha cordifolia as yerba buena and reports traditional use for toothache and headache.',
      'PITAHC reports analgesic activity in the Philippine setting.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Consult a health professional if pain persists.',
      'Do not rely on herbal preparations when urgent medical attention is needed.',
    ],
    reference: 'PITAHC Herbal Directory; PhilMedic dataset.',
  ),
};
