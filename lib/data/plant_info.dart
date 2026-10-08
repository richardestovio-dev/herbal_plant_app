import 'plant_info_tagalog.dart';

class PlantInfo {
  final String commonName;
  final String scientificName;
  final String description;
  final List<String> healthUses;
  final List<String> partsUsed;
  final List<String> precautions;
  final String reference;

  const PlantInfo({
    required this.commonName,
    required this.scientificName,
    required this.description,
    required this.healthUses,
    required this.partsUsed,
    required this.precautions,
    required this.reference,
  });
}

/// HerbVision plant information database.
///
/// IMPORTANT:
/// The commonName values below exactly match the 52 class names
/// returned by the HerbVision ONNX model.
///
/// The information is intended for educational and informational
/// purposes. Traditional uses do not replace professional medical care.

const List<PlantInfo> plantInfos = [
  // 1. Akapulko
  PlantInfo(
    commonName: 'Akapulko',
    scientificName: 'Senna alata',
    description:
        'Akapulko is a tropical shrub widely known in the Philippines '
        'for its traditional use in herbal preparations, particularly '
        'for common fungal skin conditions.',
    healthUses: [
      'Traditionally used for fungal skin conditions such as ringworm.',
      'Traditionally applied to certain itchy or irritated skin conditions.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Traditional preparations for skin conditions are generally intended for external use.',
      'Stop use if skin irritation occurs.',
      'Consult a healthcare professional for persistent or severe skin problems.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC); UST Manila Campus Plant Database',
  ),

  // 2. Aloe Vera
  PlantInfo(
    commonName: 'Aloe Vera',
    scientificName: 'Aloe vera',
    description:
        'Aloe vera is a succulent plant whose clear inner leaf gel '
        'is commonly used in traditional and cosmetic preparations.',
    healthUses: [
      'The inner gel is traditionally used to soothe minor skin irritation.',
      'Commonly used in moisturizing and skin-care preparations.',
    ],
    partsUsed: ['Leaf gel'],
    precautions: [
      'Do not confuse the inner gel with the yellow latex layer of the leaf.',
      'Avoid consuming aloe preparations unless they are specifically prepared for oral use.',
      'Stop topical use if irritation or an allergic reaction occurs.',
    ],
    reference: 'Philippine medicinal plant references and standard botanical references',
  ),

  // 3. Alugbati
  PlantInfo(
    commonName: 'Alugbati',
    scientificName: 'Basella alba',
    description:
        'Alugbati is a leafy vine commonly grown and eaten as a vegetable '
        'in the Philippines and other tropical regions.',
    healthUses: [
      'Provides dietary fiber and nutrients when consumed as a vegetable.',
      'Traditionally included in meals as a nutritious leafy food.',
    ],
    partsUsed: ['Leaves', 'Young stems'],
    precautions: [
      'Wash thoroughly before consumption.',
      'Consume as part of a balanced diet.',
      'Seek professional advice for medicinal use beyond normal food consumption.',
    ],
    reference: 'Philippine plant and food references',
  ),

  // 4. Ampalaya
  PlantInfo(
    commonName: 'Ampalaya',
    scientificName: 'Momordica charantia',
    description:
        'Ampalaya, also called bitter melon, is a widely cultivated '
        'vegetable in the Philippines and is also used in traditional herbal practices.',
    healthUses: [
      'Traditionally used as part of herbal preparations related to blood sugar management.',
      'Commonly consumed as a vegetable.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'People taking blood-sugar-lowering medicines should consult a healthcare professional before medicinal use.',
      'Excessive consumption may cause digestive discomfort.',
      'Do not use herbal preparations as a replacement for prescribed diabetes treatment.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),

  // 5. Avocado
  PlantInfo(
    commonName: 'Avocado',
    scientificName: 'Persea americana',
    description:
        'Avocado is a fruit-bearing tree cultivated in the Philippines. '
        'Its fruit is commonly consumed as food and contains fats and other nutrients.',
    healthUses: [
      'Provides dietary fats and nutrients when the fruit is consumed.',
      'Commonly included in a balanced diet.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Consume in appropriate food portions.',
      'People with known food allergies should avoid it.',
      'Traditional medicinal preparations should be discussed with a healthcare professional.',
    ],
    reference: 'Philippine plant and nutritional references',
  ),

  // 6. Balanoy
  PlantInfo(
    commonName: 'Balanoy',
    scientificName: 'Ocimum basilicum',
    description:
        'Balanoy, or basil, is an aromatic herb used as a culinary plant '
        'and in traditional herbal practices.',
    healthUses: [
      'Commonly used as a culinary herb.',
      'Traditionally used in herbal preparations for digestive and general discomfort.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Use primarily as a food herb unless advised otherwise by a qualified professional.',
      'Avoid excessive use of concentrated herbal preparations.',
      'Stop use if an allergic reaction occurs.',
    ],
    reference: 'Philippine medicinal plant references',
  ),

  // 7. Balimbing
  PlantInfo(
    commonName: 'Balimbing',
    scientificName: 'Averrhoa carambola',
    description:
        'Balimbing, or star fruit, is a tropical fruit tree commonly cultivated '
        'in the Philippines.',
    healthUses: [
      'Provides nutrients when consumed as a fruit.',
      'Traditionally included in local food and herbal practices.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'People with kidney disease should avoid star fruit unless cleared by a healthcare professional.',
      'Do not consume excessive amounts.',
      'Seek professional advice for medicinal use.',
    ],
    reference: 'Philippine plant and nutritional references',
  ),

  // 8. Banaba
  PlantInfo(
    commonName: 'Banaba',
    scientificName: 'Lagerstroemia speciosa',
    description:
        'Banaba is a flowering tree found in the Philippines and is traditionally '
        'used in herbal preparations, particularly involving its leaves.',
    healthUses: [
      'Traditionally used in herbal preparations related to blood sugar management.',
      'Leaves are commonly used in traditional preparations.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'People taking diabetes medication should consult a healthcare professional before use.',
      'Do not replace prescribed diabetes treatment with herbal preparations.',
      'Use only appropriately identified plant material.',
    ],
    reference: 'Philippine herbal medicine references',
  ),

  // 9. Banana
  PlantInfo(
    commonName: 'Banana',
    scientificName: 'Musa spp.',
    description:
        'Banana is one of the most widely cultivated tropical fruit crops '
        'and is commonly consumed as food in the Philippines.',
    healthUses: [
      'Provides carbohydrates and dietary nutrients.',
      'Contains dietary fiber and minerals when consumed as part of a balanced diet.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Consume as part of a balanced diet.',
      'People with specific dietary restrictions should follow professional advice.',
      'Medicinal use of other banana plant parts should be approached cautiously.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 10. Bayabas
  PlantInfo(
    commonName: 'Bayabas',
    scientificName: 'Psidium guajava',
    description:
        'Bayabas, or guava, is a common Philippine fruit tree. Its leaves '
        'have a long history of use in Filipino traditional herbal practices.',
    healthUses: [
      'Traditionally used in preparations for oral and hygiene purposes.',
      'Guava fruit provides vitamin C and other nutrients.',
      'Leaf preparations have traditionally been used for washing certain minor skin concerns.',
    ],
    partsUsed: ['Leaves', 'Fruit', 'Bark'],
    precautions: [
      'Use properly prepared plant material.',
      'For persistent wounds or infections, seek professional medical care.',
      'Do not use traditional preparations as a substitute for treatment of serious infections.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),

  // 11. Bignay
  PlantInfo(
    commonName: 'Bignay',
    scientificName: 'Antidesma bunius',
    description:
        'Bignay is a tropical fruit-bearing tree found in the Philippines. '
        'Its small fruits are commonly consumed when ripe.',
    healthUses: [
      'Provides nutrients and plant compounds when consumed as fruit.',
      'Traditionally used in some local food and herbal preparations.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Consume ripe fruit in appropriate amounts.',
      'Avoid unidentified or improperly prepared plant material.',
      'Consult a professional for medicinal use.',
    ],
    reference: 'Philippine plant references',
  ),

  // 12. Cacao
  PlantInfo(
    commonName: 'Cacao',
    scientificName: 'Theobroma cacao',
    description:
        'Cacao is a tropical tree cultivated for its seeds, which are processed '
        'to produce cocoa and chocolate products.',
    healthUses: [
      'Cacao products can provide naturally occurring plant compounds.',
      'Cocoa products may contribute antioxidants when consumed appropriately.',
    ],
    partsUsed: ['Seeds'],
    precautions: [
      'Processed chocolate products may contain significant sugar and fat.',
      'People sensitive to caffeine or stimulants should moderate intake.',
      'Use as a food rather than as a substitute for medical treatment.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 13. Calamansi
  PlantInfo(
    commonName: 'Calamansi',
    scientificName: 'Citrus × microcarpa',
    description:
        'Calamansi is a small citrus fruit widely cultivated in the Philippines '
        'and commonly used in beverages, cooking, and traditional preparations.',
    healthUses: [
      'Provides vitamin C and other nutrients.',
      'Commonly used as a citrus flavoring and beverage ingredient.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Highly acidic juice may irritate sensitive stomachs or teeth.',
      'Avoid applying concentrated citrus juice to irritated skin.',
      'Consume as part of a balanced diet.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 14. Dalandan
  PlantInfo(
    commonName: 'Dalandan',
    scientificName: 'Citrus aurantium',
    description:
        'Dalandan is a citrus fruit commonly consumed in the Philippines '
        'and used in juices and food preparations.',
    healthUses: [
      'Provides vitamin C and other nutrients.',
      'Commonly consumed as fresh fruit or juice.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Acidic juice may irritate sensitive teeth or stomachs.',
      'Wash fruit before preparation.',
      'Consume in appropriate amounts.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 15. Duhat
  PlantInfo(
    commonName: 'Duhat',
    scientificName: 'Syzygium cumini',
    description:
        'Duhat is a tropical fruit tree whose dark purple fruits are commonly '
        'eaten fresh in the Philippines.',
    healthUses: [
      'The fruit provides dietary nutrients and plant compounds.',
      'Traditionally used in some local herbal practices.',
    ],
    partsUsed: ['Fruit', 'Seeds', 'Leaves'],
    precautions: [
      'Consume ripe fruit in appropriate amounts.',
      'People taking blood-sugar medication should seek professional advice before using concentrated preparations.',
      'Avoid relying on traditional preparations for treatment of medical conditions.',
    ],
    reference: 'Philippine plant and nutritional references',
  ),

  // 16. Gumamela
  PlantInfo(
    commonName: 'Gumamela',
    scientificName: 'Hibiscus rosa-sinensis',
    description:
        'Gumamela is a common ornamental flowering shrub in the Philippines '
        'and is also known in traditional herbal practices.',
    healthUses: [
      'Traditionally used in some preparations for minor skin and hair care.',
      'Flowers are commonly used in traditional preparations.',
    ],
    partsUsed: ['Flowers', 'Leaves'],
    precautions: [
      'Use only correctly identified plant material.',
      'Avoid ingesting concentrated preparations unless professionally advised.',
      'Stop use if irritation or allergic reaction occurs.',
    ],
    reference: 'Philippine plant references',
  ),

  // 17. Guyabano
  PlantInfo(
    commonName: 'Guyabano',
    scientificName: 'Annona muricata',
    description:
        'Guyabano, or soursop, is a tropical fruit tree commonly grown '
        'in the Philippines.',
    healthUses: [
      'The fruit provides nutrients when consumed as food.',
      'Traditionally used in some local herbal practices.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Consume the fruit as food rather than relying on concentrated leaf preparations.',
      'Safety of concentrated preparations should be discussed with a healthcare professional.',
      'Do not use as a replacement for cancer or other medical treatment.',
    ],
    reference: 'Philippine plant and nutritional references',
  ),

  // 18. Ikmo
  PlantInfo(
    commonName: 'Ikmo',
    scientificName: 'Piper betle',
    description:
        'Ikmo, or betel leaf, is a tropical climbing plant traditionally used '
        'in various Philippine and Southeast Asian cultural practices.',
    healthUses: [
      'Leaves are traditionally used in external and household herbal preparations.',
      'Historically used in local cultural and traditional practices.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Avoid chewing mixtures containing tobacco or areca nut because these are associated with serious health risks.',
      'Use properly identified and clean leaves.',
      'Consult a healthcare professional before medicinal use.',
    ],
    reference: 'Philippine botanical and traditional medicine references',
  ),

  // 19. Ipil-Ipil
  PlantInfo(
    commonName: 'Ipil-Ipil',
    scientificName: 'Leucaena leucocephala',
    description:
        'Ipil-ipil is a fast-growing tropical tree widely found in the Philippines '
        'and commonly used for food, forage, fuel, and other purposes.',
    healthUses: [
      'Young leaves and seeds have been used traditionally in some communities.',
      'The plant is primarily valued for agricultural and ecological uses.',
    ],
    partsUsed: ['Young leaves', 'Seeds'],
    precautions: [
      'Raw or excessive consumption of seeds and leaves is not recommended.',
      'Certain plant compounds can be harmful in large amounts.',
      'Do not use medicinally without appropriate professional guidance.',
    ],
    reference: 'Philippine agricultural and botanical references',
  ),

  // 20. Kakawate
  PlantInfo(
    commonName: 'Kakawate',
    scientificName: 'Gliricidia sepium',
    description:
        'Kakawate is a tropical tree commonly planted in the Philippines '
        'for fencing, soil improvement, and other agricultural uses.',
    healthUses: [
      'Traditionally used in some communities for external plant preparations.',
      'Primarily valued for agricultural and environmental purposes.',
    ],
    partsUsed: ['Leaves', 'Bark'],
    precautions: [
      'Do not ingest unverified Kakawate preparations.',
      'Plant material can be irritating or toxic when improperly used.',
      'Use only under appropriate professional guidance for medicinal purposes.',
    ],
    reference: 'Philippine agricultural and botanical references',
  ),

  // 21. Kalachuchi
  PlantInfo(
    commonName: 'Kalachuchi',
    scientificName: 'Plumeria rubra',
    description:
        'Kalachuchi is a flowering ornamental tree commonly grown in Philippine '
        'gardens and landscapes.',
    healthUses: [
      'Traditionally used in some local external herbal preparations.',
      'Primarily valued as an ornamental plant.',
    ],
    partsUsed: ['Flowers', 'Leaves'],
    precautions: [
      'The milky latex can irritate the skin and eyes.',
      'Do not ingest plant parts without professional guidance.',
      'Keep plant material away from children and pets.',
    ],
    reference: 'Philippine botanical references',
  ),

  // 22. Kamantigi
  PlantInfo(
    commonName: 'Kamantigi',
    scientificName: 'Impatiens balsamina',
    description:
        'Kamantigi is a flowering plant commonly grown as an ornamental '
        'plant in tropical areas including the Philippines.',
    healthUses: [
      'Traditionally used in some communities in external herbal preparations.',
      'Commonly grown for its ornamental flowers.',
    ],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Use only properly identified plant material.',
      'Avoid ingestion of concentrated preparations without professional advice.',
      'Stop external use if skin irritation occurs.',
    ],
    reference: 'Philippine botanical references',
  ),

  // 23. Kamantigue
  PlantInfo(
    commonName: 'Kamantigue',
    scientificName: 'Impatiens balsamina',
    description:
        'Kamantigue is a common Philippine name used for the flowering '
        'ornamental plant Impatiens balsamina.',
    healthUses: [
      'Traditionally used in some local external preparations.',
      'Primarily cultivated as an ornamental flowering plant.',
    ],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Use only properly identified plant material.',
      'Avoid ingestion of concentrated preparations without professional advice.',
      'Stop use if skin irritation occurs.',
    ],
    reference: 'Philippine botanical references',
  ),

  // 24. Kamias
  PlantInfo(
    commonName: 'Kamias',
    scientificName: 'Averrhoa bilimbi',
    description:
        'Kamias is a tropical fruit tree commonly cultivated in Philippine '
        'backyards and used in cooking.',
    healthUses: [
      'Provides nutrients and plant compounds when consumed as food.',
      'Traditionally used in local food and household preparations.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'The fruit is highly acidic and may irritate the stomach or teeth.',
      'People with kidney problems should avoid excessive consumption.',
      'Consume in appropriate food amounts.',
    ],
    reference: 'Philippine plant and food references',
  ),

  // 25. Kamote
  PlantInfo(
    commonName: 'Kamote',
    scientificName: 'Ipomoea batatas',
    description:
        'Kamote, or sweet potato, is an important food crop in the Philippines. '
        'Both its roots and leaves are commonly eaten.',
    healthUses: [
      'Provides carbohydrates, dietary fiber, vitamins, and minerals.',
      'Leaves can be consumed as a nutritious vegetable.',
    ],
    partsUsed: ['Tuber', 'Leaves'],
    precautions: [
      'Cook properly before eating.',
      'Consume as part of a balanced diet.',
      'People with specific dietary restrictions should follow professional advice.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 26. Kamoteng kahoy
  PlantInfo(
    commonName: 'Kamoteng kahoy',
    scientificName: 'Manihot esculenta',
    description:
        'Kamoteng kahoy, or cassava, is a major tropical root crop cultivated '
        'and consumed in the Philippines.',
    healthUses: [
      'Provides carbohydrates and energy when properly prepared.',
      'Cassava leaves may be consumed as a vegetable when properly processed.',
    ],
    partsUsed: ['Root', 'Leaves'],
    precautions: [
      'Raw cassava contains naturally occurring cyanogenic compounds and must be properly processed and cooked.',
      'Do not consume raw cassava.',
      'Follow safe food-preparation practices.',
    ],
    reference: 'Philippine agricultural and food-safety references',
  ),

  // 27. Kangkong
  PlantInfo(
    commonName: 'Kangkong',
    scientificName: 'Ipomoea aquatica',
    description:
        'Kangkong is a leafy vegetable widely consumed in the Philippines '
        'and other tropical countries.',
    healthUses: [
      'Provides dietary fiber and nutrients.',
      'Commonly consumed as a cooked leafy vegetable.',
    ],
    partsUsed: ['Leaves', 'Young stems'],
    precautions: [
      'Wash thoroughly and cook appropriately.',
      'Avoid harvesting from polluted waterways.',
      'Consume as part of a balanced diet.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 28. Katakataka
  PlantInfo(
    commonName: 'Katakataka',
    scientificName: 'Kalanchoe pinnata',
    description:
        'Katakataka is a succulent plant commonly grown in Philippine homes '
        'and is known in traditional herbal practices.',
    healthUses: [
      'Traditionally used in some communities for external preparations.',
      'Leaves have been used in folk practices for minor skin concerns.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Avoid ingesting large or concentrated amounts.',
      'Use only properly identified plant material.',
      'Consult a healthcare professional before medicinal use.',
    ],
    reference: 'Philippine botanical and traditional medicine references',
  ),

  // 29. Katuray
  PlantInfo(
    commonName: 'Katuray',
    scientificName: 'Sesbania grandiflora',
    description:
        'Katuray is a small tropical tree whose flowers and young parts '
        'are commonly used as food in the Philippines.',
    healthUses: [
      'Flowers and young leaves can provide nutrients when properly prepared as food.',
      'Traditionally included in local diets.',
    ],
    partsUsed: ['Flowers', 'Young leaves'],
    precautions: [
      'Wash and cook properly before consumption.',
      'Consume as food rather than relying on it as a medical treatment.',
      'Avoid unidentified plant parts.',
    ],
    reference: 'Philippine agricultural and food references',
  ),

  // 30. Lagundi
  PlantInfo(
    commonName: 'Lagundi',
    scientificName: 'Vitex negundo',
    description:
        'Lagundi is a Philippine medicinal plant traditionally used in '
        'herbal preparations, especially for respiratory discomfort.',
    healthUses: [
      'Traditionally used for cough and respiratory discomfort.',
      'Leaves are commonly used in Philippine herbal preparations.',
    ],
    partsUsed: ['Leaves', 'Flowers'],
    precautions: [
      'Do not use as a substitute for professional medical treatment.',
      'Consult a healthcare professional if respiratory symptoms persist or worsen.',
      'Use appropriately prepared plant material.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),

  // 31. Luya
  PlantInfo(
    commonName: 'Luya',
    scientificName: 'Zingiber officinale',
    description:
        'Luya, or ginger, is widely used in Filipino cooking and traditional '
        'herbal preparations.',
    healthUses: [
      'Traditionally used for digestive discomfort.',
      'Commonly prepared as a herbal drink.',
      'Commonly used as a food seasoning.',
    ],
    partsUsed: ['Rhizome'],
    precautions: [
      'Use in appropriate food or traditional preparation amounts.',
      'Large amounts may cause digestive discomfort in some people.',
      'Consult a healthcare professional when using it for a medical condition.',
    ],
    reference: 'Philippine food and traditional herbal references',
  ),

  // 32. Malunggay
  PlantInfo(
    commonName: 'Malunggay',
    scientificName: 'Moringa oleifera',
    description:
        'Malunggay is a commonly cultivated plant in the Philippines whose '
        'leaves are traditionally used as food and in herbal practices.',
    healthUses: [
      'Traditionally used as a nutritious leafy vegetable.',
      'Contains various vitamins, minerals, and other plant nutrients.',
      'Commonly included in soups and other Filipino dishes.',
    ],
    partsUsed: ['Leaves', 'Pods'],
    precautions: [
      'Use as a food or traditional herbal preparation in appropriate amounts.',
      'Consult a qualified healthcare professional for medical concerns.',
      'Do not use concentrated preparations as a substitute for prescribed treatment.',
    ],
    reference: 'Philippine herbal and nutritional references',
  ),

  // 33. Mangga
  PlantInfo(
    commonName: 'Mangga',
    scientificName: 'Mangifera indica',
    description:
        'Mangga, or mango, is one of the most widely known tropical fruit '
        'trees in the Philippines.',
    healthUses: [
      'Mango fruit provides vitamins, dietary fiber, and other nutrients.',
      'Commonly consumed as fresh fruit or in food preparations.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Consume fruit in appropriate portions.',
      'People with fruit allergies should avoid it.',
      'Traditional medicinal use of leaves should be discussed with a professional.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 34. Mani
  PlantInfo(
    commonName: 'Mani',
    scientificName: 'Arachis hypogaea',
    description:
        'Mani, or peanut, is an important food crop commonly consumed in '
        'the Philippines.',
    healthUses: [
      'Provides protein and dietary fats.',
      'Contains several vitamins and minerals when consumed as part of a balanced diet.',
    ],
    partsUsed: ['Seeds'],
    precautions: [
      'Peanuts can cause severe allergic reactions in sensitive individuals.',
      'Consume properly stored and prepared products.',
      'Avoid spoiled or mold-contaminated peanuts.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 35. Niyog-niyogan
  PlantInfo(
    commonName: 'Niyog-niyogan',
    scientificName: 'Quisqualis indica',
    description:
        'Niyog-niyogan is a tropical climbing plant traditionally recognized '
        'in Philippine herbal medicine.',
    healthUses: [
      'Traditionally used for intestinal worm-related preparations.',
      'Mature dried seeds are the traditionally used plant part.',
    ],
    partsUsed: ['Mature seeds'],
    precautions: [
      'Use should follow appropriate professional guidance.',
      'Do not give medicinal preparations to young children without professional advice.',
      'Do not exceed recommended traditional preparations.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),

  // 36. Oregano
  PlantInfo(
    commonName: 'Oregano',
    scientificName: 'Origanum vulgare',
    description:
        'Oregano is an aromatic herb commonly grown in Philippine households '
        'and used in cooking and traditional herbal preparations.',
    healthUses: [
      'Traditionally prepared as a herbal drink for cough and respiratory discomfort.',
      'Commonly used as a culinary herb.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Use food-level amounts unless advised otherwise.',
      'Concentrated oils may irritate the skin or digestive tract.',
      'Consult a healthcare professional for persistent respiratory symptoms.',
    ],
    reference: 'Philippine traditional herbal references',
  ),

  // 37. Pandan
  PlantInfo(
    commonName: 'Pandan',
    scientificName: 'Pandanus amaryllifolius',
    description:
        'Pandan is a fragrant tropical plant widely used in Philippine '
        'cooking, desserts, and beverages.',
    healthUses: [
      'Commonly used as a food flavoring and aromatic ingredient.',
      'Traditionally used in some household herbal preparations.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Use clean leaves prepared appropriately for food.',
      'Do not assume that traditional preparations can treat medical conditions.',
      'Consult a professional for medicinal use.',
    ],
    reference: 'Philippine culinary and botanical references',
  ),

  // 38. Panhauli
  PlantInfo(
    commonName: 'Panhauli',
    scientificName: 'Plectranthus amboinicus',
    description:
        'Panhauli is an aromatic herb commonly grown in tropical areas '
        'and known for its thick, fragrant leaves.',
    healthUses: [
      'Traditionally used as a household herbal preparation for cough and colds.',
      'Leaves are also used as an aromatic culinary herb.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Use moderate amounts for traditional preparations.',
      'Avoid concentrated preparations without professional guidance.',
      'Seek medical attention for persistent respiratory symptoms.',
    ],
    reference: 'Philippine traditional herbal references',
  ),

  // 39. Pansit pansitan
  PlantInfo(
    commonName: 'Pansit pansitan',
    scientificName: 'Peperomia pellucida',
    description:
        'Pansit pansitan, also called Ulasimang bato, is a small herb traditionally '
        'used in Philippine herbal medicine.',
    healthUses: [
      'Traditionally used in preparations related to uric acid and joint discomfort.',
      'The plant may be eaten as a fresh vegetable in some traditional practices.',
    ],
    partsUsed: ['Leaves', 'Stems'],
    precautions: [
      'People with kidney or gout-related conditions should consult a healthcare professional.',
      'Do not replace prescribed treatment with herbal preparations.',
      'Use properly identified and clean plant material.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),

  // 40. Papaya
  PlantInfo(
    commonName: 'Papaya',
    scientificName: 'Carica papaya',
    description:
        'Papaya is a tropical fruit tree widely cultivated in the Philippines '
        'and commonly consumed as food.',
    healthUses: [
      'Ripe fruit provides vitamins, dietary fiber, and other nutrients.',
      'Unripe fruit is commonly used in Filipino cooking.',
    ],
    partsUsed: ['Fruit', 'Leaves'],
    precautions: [
      'Consume properly prepared fruit.',
      'Pregnant individuals should consult a healthcare professional before using concentrated preparations of unripe papaya or latex.',
      'Do not use papaya preparations as a substitute for medical treatment.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 41. Saluyot
  PlantInfo(
    commonName: 'Saluyot',
    scientificName: 'Corchorus olitorius',
    description:
        'Saluyot is a leafy vegetable widely consumed in the Philippines '
        'and is valued for its edible leaves.',
    healthUses: [
      'Provides dietary fiber and nutrients.',
      'Commonly eaten as a cooked leafy vegetable.',
    ],
    partsUsed: ['Leaves', 'Young shoots'],
    precautions: [
      'Wash and cook properly before consumption.',
      'Consume as part of a balanced diet.',
      'Medicinal use beyond food consumption should be discussed with a professional.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 42. Sambong
  PlantInfo(
    commonName: 'Sambong',
    scientificName: 'Blumea balsamifera',
    description:
        'Sambong is a traditional Philippine medicinal plant commonly '
        'prepared as a tea or herbal preparation.',
    healthUses: [
      'Traditionally used as a diuretic.',
      'Traditionally used in preparations related to urinary concerns.',
      'Leaves are commonly used in Philippine herbal preparations.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'People with kidney or urinary conditions should consult a healthcare professional.',
      'Do not use herbal preparations as a substitute for diagnosis or prescribed treatment.',
      'Use properly prepared plant material.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),

  // 43. Sampa Sampalokan
  PlantInfo(
    commonName: 'Sampa Sampalokan',
    scientificName: 'Tamarindus indica',
    description:
        'Sampa Sampalokan is a local name associated with tamarind, a tropical '
        'tree widely used as a food and flavoring plant in the Philippines.',
    healthUses: [
      'Tamarind fruit provides dietary fiber and other nutrients.',
      'Commonly used to add a sour flavor to Filipino dishes and beverages.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Consume in moderate food amounts.',
      'Highly acidic preparations may irritate sensitive teeth or stomachs.',
      'Consult a professional for medicinal use.',
    ],
    reference: 'Philippine agricultural and culinary references',
  ),

  // 44. Sampa Sampalukan
  PlantInfo(
    commonName: 'Sampa Sampalukan',
    scientificName: 'Tamarindus indica',
    description:
        'Sampa Sampalukan is a local name associated with tamarind, which is '
        'commonly used as a food ingredient and traditional plant.',
    healthUses: [
      'Fruit provides dietary fiber and plant nutrients.',
      'Commonly used as a souring ingredient in Filipino dishes.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Consume in moderate food amounts.',
      'Acidic preparations may irritate sensitive teeth or stomachs.',
      'Seek professional advice for medicinal use.',
    ],
    reference: 'Philippine agricultural and culinary references',
  ),

  // 45. Sampalok
  PlantInfo(
    commonName: 'Sampalok',
    scientificName: 'Tamarindus indica',
    description:
        'Sampalok, or tamarind, is a tropical tree widely used in Filipino '
        'cooking, particularly as a souring ingredient.',
    healthUses: [
      'Provides dietary fiber and nutrients when consumed as fruit.',
      'Commonly used as a food ingredient and beverage flavoring.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Consume in appropriate food amounts.',
      'Acidic foods may irritate sensitive teeth or stomachs.',
      'Do not use concentrated preparations as a substitute for medical care.',
    ],
    reference: 'Philippine agricultural and nutritional references',
  ),

  // 46. Siling Labuyo
  PlantInfo(
    commonName: 'Siling Labuyo',
    scientificName: 'Capsicum frutescens',
    description:
        'Siling labuyo is a small hot pepper commonly used as a spice '
        'in Filipino cuisine.',
    healthUses: [
      'Contains capsaicin and other plant compounds.',
      'Commonly used as a culinary spice.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'May cause burning or irritation when consumed in large amounts.',
      'Avoid contact with eyes and sensitive skin after handling.',
      'People with digestive sensitivity may need to limit spicy foods.',
    ],
    reference: 'Philippine culinary and botanical references',
  ),

  // 47. Suha
  PlantInfo(
    commonName: 'Suha',
    scientificName: 'Citrus maxima',
    description:
        'Suha, or pomelo, is a large citrus fruit commonly cultivated '
        'and consumed in the Philippines.',
    healthUses: [
      'Provides vitamin C and dietary fiber.',
      'Commonly consumed as fresh fruit.',
    ],
    partsUsed: ['Fruit'],
    precautions: [
      'Pomelo can interact with some medications, so people taking prescription medicines should ask a healthcare professional before consuming large amounts.',
      'Consume as part of a balanced diet.',
      'Avoid if allergic to citrus fruits.',
    ],
    reference: 'Philippine nutritional and botanical references',
  ),

  // 48. Tanglad
  PlantInfo(
    commonName: 'Tanglad',
    scientificName: 'Cymbopogon citratus',
    description:
        'Tanglad, or lemongrass, is an aromatic grass widely used in Filipino '
        'cooking and traditional herbal drinks.',
    healthUses: [
      'Commonly used as a culinary herb.',
      'Traditionally prepared as a fragrant herbal tea.',
    ],
    partsUsed: ['Leaves', 'Stalks'],
    precautions: [
      'Use food-level amounts for ordinary consumption.',
      'Concentrated preparations may not be appropriate for everyone.',
      'Consult a healthcare professional for medicinal use during pregnancy or for chronic conditions.',
    ],
    reference: 'Philippine culinary and traditional herbal references',
  ),

  // 49. Tawa tawa
  PlantInfo(
    commonName: 'Tawa tawa',
    scientificName: 'Euphorbia hirta',
    description:
        'Tawa-tawa is a small herb commonly found in tropical areas and is '
        'known in Philippine folk medicine.',
    healthUses: [
      'Traditionally used in some Philippine folk preparations.',
      'Historically used in traditional practices for various minor ailments.',
    ],
    partsUsed: ['Whole plant'],
    precautions: [
      'Traditional use does not establish that it can treat serious illnesses.',
      'Do not use it as a substitute for medical care, especially for dengue or bleeding conditions.',
      'Consult a healthcare professional before using medicinal preparations.',
    ],
    reference: 'Philippine traditional medicine and botanical references',
  ),

  // 50. Tsaang Gubat
  PlantInfo(
    commonName: 'Tsaang Gubat',
    scientificName: 'Ehretia microphylla',
    description:
        'Tsaang Gubat is a Philippine shrub traditionally prepared as a tea '
        'and recognized in Philippine herbal medicine.',
    healthUses: [
      'Traditionally prepared as a tea for digestive discomfort.',
      'Traditionally used in preparations related to diarrhea and abdominal discomfort.',
      'Leaves have also been traditionally used for oral hygiene preparations.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Persistent diarrhea or severe abdominal pain requires medical attention.',
      'Use properly identified and clean leaves.',
      'Do not rely on herbal tea as a replacement for medical treatment.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC); UST Manila Campus Plant Database',
  ),

  // 51. Turmeric Dulaw
  PlantInfo(
    commonName: 'Turmeric Dulaw',
    scientificName: 'Curcuma longa',
    description:
        'Turmeric, locally known as dulaw, is a rhizomatous plant widely '
        'used as a spice, food coloring, and traditional herbal ingredient.',
    healthUses: [
      'Traditionally used for general wellness and digestive preparations.',
      'Contains curcuminoids and other naturally occurring plant compounds.',
      'Commonly used as a culinary spice.',
    ],
    partsUsed: ['Rhizome'],
    precautions: [
      'Large amounts may cause digestive discomfort.',
      'People with gallbladder or bile-duct conditions should consult a healthcare professional before using concentrated preparations.',
      'Use caution with concentrated supplements or extracts.',
    ],
    reference: 'Philippine culinary and traditional herbal references',
  ),

  // 52. Yerba Buena
  PlantInfo(
    commonName: 'Yerba Buena',
    scientificName: 'Clinopodium douglasii',
    description:
        'Yerba Buena is an aromatic mint-family herb traditionally used '
        'in Philippine herbal medicine.',
    healthUses: [
      'Traditionally used as an herbal preparation for minor body aches and discomfort.',
      'Traditionally prepared as a tea.',
      'Leaves may be used in some external preparations.',
    ],
    partsUsed: ['Leaves'],
    precautions: [
      'Use appropriately prepared leaves.',
      'Do not rely on herbal preparations for severe or persistent pain.',
      'Consult a healthcare professional when symptoms persist.',
    ],
    reference: 'Philippine Institute of Traditional and Alternative Health Care (PITAHC)',
  ),
];

PlantInfoTagalog _getPlantInfoTagalog(PlantInfo plant) {
  final translation = plantInfoTagalog[plant.commonName];
  if (translation == null) {
    throw StateError('Missing Tagalog translation for ${plant.commonName}.');
  }
  return translation;
}

/// Returns the Tagalog description for a supported plant.
String getPlantDescriptionTagalog(PlantInfo plant) {
  return _getPlantInfoTagalog(plant).description;
}

/// Returns the Tagalog health uses for a supported plant.
List<String> getPlantHealthUsesTagalog(PlantInfo plant) {
  return _getPlantInfoTagalog(plant).healthUses;
}

/// Returns the Tagalog parts used for a supported plant.
List<String> getPlantPartsUsedTagalog(PlantInfo plant) {
  return _getPlantInfoTagalog(plant).partsUsed;
}

/// Returns the Tagalog precautions for a supported plant.
List<String> getPlantPrecautionsTagalog(PlantInfo plant) {
  return _getPlantInfoTagalog(plant).precautions;
}

/// Finds plant information using the exact model prediction.
///
/// The lookup is case-insensitive and ignores accidental spaces.
/// This helps prevent problems such as:
///
/// "Malunggay"
/// "malunggay"
/// "Malunggay "
///
/// all being treated as the same plant.
PlantInfo? findPlantInfo(String predictedName) {
  final normalizedPrediction = predictedName.trim().toLowerCase();

  for (final plant in plantInfos) {
    if (plant.commonName.trim().toLowerCase() == normalizedPrediction) {
      return plant;
    }
  }

  return null;
}
