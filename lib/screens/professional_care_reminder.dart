import 'package:flutter/material.dart';

class ProfessionalCareReminder extends StatelessWidget {
  final bool isTagalog;

  const ProfessionalCareReminder({super.key, this.isTagalog = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF3FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFC9DDF5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.health_and_safety_outlined,
            color: Color(0xFF315D8A),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              isTagalog
                  ? 'Paalala: Ang mga halamang-gamot ay maaaring makatulong '
                        'bilang pandagdag lamang; hindi ito lunas at hindi '
                        'pamalit sa pagsusuri, reseta, o paggamot ng doktor. '
                        'Kumonsulta sa doktor o kwalipikadong propesyonal sa '
                        'kalusugan bago gumamit ng halamang-gamot, lalo na '
                        'kung may iniinom na gamot o may kondisyon sa kalusugan.'
                  : 'Reminder: Herbal plants may be used as supportive care, '
                        'but they are not a cure and do not replace a doctor’s '
                        'diagnosis, prescription, or treatment. Consult a '
                        'doctor or qualified healthcare professional before '
                        'using herbal remedies, especially if you take '
                        'medication or have a health condition.',
              style: const TextStyle(
                color: Color(0xFF315D8A),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
