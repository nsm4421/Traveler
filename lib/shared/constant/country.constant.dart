enum Country {
  korea(
    code: 'KR',
    phoneCode: '+82',
    emoji: '🇰🇷',
    name: 'South Korea',
  ),
  china(
    code: 'CN',
    phoneCode: '+86',
    emoji: '🇨🇳',
    name: 'China',
  ),
  japan(code: 'JP', phoneCode: '+81', emoji: '🇯🇵', name: 'Japan'),
  thailand(
    code: 'TH',
    phoneCode: '+66',
    emoji: '🇹🇭',
    name: 'Thailand',
  ),
  philippines(code: 'PH', phoneCode: '+63', emoji: '🇵🇭', name: 'Philippines'),
  usa(
    code: 'US',
    phoneCode: '+1',
    emoji: '🇺🇸',
    name: 'United States',
  ),
  uk(
    code: 'GB',
    phoneCode: '+44',
    emoji: '🇬🇧',
    name: 'United Kingdom',
  );

  final String code; // 국가 코드
  final String phoneCode; // 전화번호 코드
  final String emoji; // 국가 이모지
  final String name;

  const Country(
      {required this.code,
      required this.phoneCode,
      required this.emoji,
      required this.name}); // 국가 이름
}
