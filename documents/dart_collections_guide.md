# Dart 컬렉션 타입 가이드: List, Set, Map

## 📋 목차
1. [List (리스트)](#list-리스트)
2. [Set (셋)](#set-셋)
3. [Map (맵)](#map-맵)
4. [비교표](#비교표)
5. [언제 무엇을 사용할까?](#언제-무엇을-사용할까)
6. [시간 복잡도 (Big O)](#시간-복잡도-big-o)

---

## List (리스트)

### 정의
- **순서가 있는** 요소들의 컬렉션
- **중복 요소 허용**
- **인덱스로 접근 가능** (0부터 시작)

### 문법
```dart
// 타입 명시
List<int> numbers = [1, 2, 3, 4, 5];

// 타입 추론
final numbers = <int>[1, 2, 3, 4, 5];

// 빈 리스트
final emptyList = <int>[];
```

### 주요 특징
- ✅ 순서 보장 (삽입 순서 유지)
- ✅ 중복 허용
- ✅ 인덱스 접근 가능 (`list[0]`)
- ✅ 동적 크기 조절 가능

### 주요 메서드
```dart
final list = <int>[1, 2, 3];

// 추가
list.add(4);                    // [1, 2, 3, 4]
list.addAll([5, 6]);            // [1, 2, 3, 4, 5, 6]
list.insert(0, 0);              // [0, 1, 2, 3, 4, 5, 6]

// 삭제
list.remove(3);                 // [0, 1, 2, 4, 5, 6]
list.removeAt(0);              // [1, 2, 4, 5, 6]
list.clear();                    // []

// 접근
final first = list[0];          // 첫 번째 요소
final last = list.last;          // 마지막 요소
final length = list.length;      // 길이

// 검색
final contains = list.contains(2);  // true/false
final index = list.indexOf(2);      // 인덱스 반환

// 순회
for (int i = 0; i < list.length; i++) {
  print(list[i]);
}

for (final item in list) {
  print(item);
}
```

### 사용 예시
```dart
// 쇼핑 리스트 (순서 중요)
final shoppingList = ['우유', '빵', '계란'];

// 점수 목록 (중복 허용)
final scores = [85, 90, 85, 88];

// 메뉴 항목 (인덱스로 접근)
final menuItems = ['홈', '검색', '프로필'];
final firstItem = menuItems[0]; // '홈'
```

---

## Set (셋)

### 정의
- **중복 없는** 요소들의 컬렉션
- **순서 보장 안 함** (일부 구현체는 순서 유지 가능)
- **인덱스 접근 불가**

### 문법
```dart
// 타입 명시
Set<int> ids = {1, 2, 3, 4, 5};

// 타입 추론
final ids = <int>{1, 2, 3, 4, 5};

// 빈 Set
final emptySet = <int>{};
```

### 주요 특징
- ✅ 중복 자동 제거
- ✅ 빠른 검색 (O(1) 평균)
- ❌ 인덱스 접근 불가
- ❌ 순서 보장 안 함 (LinkedHashSet은 순서 유지)

### 주요 메서드
```dart
final set = <int>{1, 2, 3};

// 추가
set.add(4);                     // {1, 2, 3, 4}
set.addAll([5, 6]);             // {1, 2, 3, 4, 5, 6}
set.add(3);                     // {1, 2, 3, 4, 5, 6} (중복 무시)

// 삭제
set.remove(3);                  // {1, 2, 4, 5, 6}
set.clear();                     // {}

// 검색
final contains = set.contains(2);  // true/false (O(1) - 매우 빠름!)

// 집합 연산
final set1 = {1, 2, 3};
final set2 = {2, 3, 4};

final intersection = set1.intersection(set2);  // {2, 3} (교집합)
final union = set1.union(set2);                // {1, 2, 3, 4} (합집합)
final difference = set1.difference(set2);      // {1} (차집합)

// 순회
for (final item in set) {
  print(item);
}
```

### 사용 예시
```dart
// 북마크 ID (중복 방지)
final _ids = <int>{2, 4};

// 고유한 태그 목록
final uniqueTags = {'한식', '양식', '중식', '일식'};

// 저장된 사용자 ID
final savedUserIds = <int>{1, 3, 5, 7};
if (savedUserIds.contains(3)) {  // 빠른 검색!
  print('이미 저장됨');
}
```

---

## Map (맵)

### 정의
- **키-값 쌍(key-value pair)**을 저장하는 컬렉션
- **키는 중복 불가**, 값은 중복 가능
- **키로 값을 빠르게 찾을 수 있음**

### 문법
```dart
// 타입 명시
Map<String, int> scores = {
  '철수': 85,
  '영희': 90,
};

// 타입 추론
final scores = <String, int>{
  '철수': 85,
  '영희': 90,
};

// 빈 Map
final emptyMap = <String, int>{};
```

### 주요 특징
- ✅ 키-값 쌍 저장
- ✅ 키로 빠른 검색 (O(1) 평균)
- ✅ 키는 중복 불가, 값은 중복 가능
- ❌ 인덱스 접근 불가 (키로만 접근)

### 주요 메서드
```dart
final map = <String, int>{
  '철수': 85,
  '영희': 90,
};

// 추가/수정
map['민수'] = 88;                // {'철수': 85, '영희': 90, '민수': 88}
map['철수'] = 90;                // {'철수': 90, '영희': 90, '민수': 88} (수정)

// 접근
final score = map['철수'];       // 90
final score2 = map['없는키'];    // null

// 안전한 접근
final score3 = map['철수'] ?? 0; // 값이 null이면 0 반환

// 삭제
map.remove('민수');              // {'철수': 90, '영희': 90}
map.clear();                     // {}

// 검색
final hasKey = map.containsKey('철수');  // true
final hasValue = map.containsValue(90);  // true

// 키/값 목록
final keys = map.keys;           // {'철수', '영희'}
final values = map.values;       // {90, 90}

// 순회
for (final entry in map.entries) {
  print('${entry.key}: ${entry.value}');
}

for (final key in map.keys) {
  print('$key: ${map[key]}');
}

map.forEach((key, value) {
  print('$key: $value');
});
```

### 사용 예시
```dart
// 사용자 이름-점수
final userScores = <String, int>{
  '철수': 85,
  '영희': 90,
  '민수': 88,
};

// 레시피 ID-북마크 시간
final bookmarkTimes = <int, DateTime>{
  2: DateTime(2024, 1, 15),
  4: DateTime(2024, 1, 20),
};

// 설정값 저장
final settings = <String, dynamic>{
  'theme': 'dark',
  'language': 'ko',
  'notifications': true,
};
```

---

## 비교표

| 특징 | List | Set | Map |
|------|------|-----|-----|
| **저장하는 것** | 값만 | 값만 | 키-값 쌍 |
| **문법** | `[1, 2, 3]` | `{1, 2, 3}` | `{'key': 'value'}` |
| **순서** | ✅ 보장 | ❌ 보장 안 함 | ❌ 보장 안 함 |
| **중복** | ✅ 허용 | ❌ 불가 | 키 중복 불가, 값 중복 가능 |
| **인덱스 접근** | ✅ 가능 (`list[0]`) | ❌ 불가 | ❌ 불가 (키로 접근) |
| **검색 속도** | O(n) | O(1) 평균 | O(1) 평균 |
| **주요 용도** | 순서 있는 목록 | 고유한 값 집합 | 키로 값 찾기 |

---

## 언제 무엇을 사용할까?

### List를 사용하는 경우

✅ **순서가 중요한 경우**
```dart
final shoppingList = ['우유', '빵', '계란']; // 구매 순서
```

✅ **중복이 허용되어야 하는 경우**
```dart
final scores = [85, 90, 85, 88]; // 같은 점수가 여러 번
```

✅ **인덱스로 접근이 필요한 경우**
```dart
final menuItems = ['홈', '검색', '프로필'];
final firstItem = menuItems[0]; // '홈'
```

✅ **순차적으로 처리하는 경우**
```dart
for (int i = 0; i < items.length; i++) {
  print('${i + 1}. ${items[i]}');
}
```

### Set을 사용하는 경우

✅ **중복을 방지해야 하는 경우**
```dart
final _ids = <int>{2, 4}; // 북마크 ID - 같은 ID를 여러 번 저장하면 안 됨
```

✅ **빠른 검색이 필요한 경우**
```dart
final savedIds = <int>{1, 3, 5, 7};
if (savedIds.contains(3)) { // O(1) - 매우 빠름!
  print('이미 저장됨');
}
```

✅ **고유한 값들만 관리하는 경우**
```dart
final uniqueTags = {'한식', '양식', '중식', '일식'}; // 태그는 중복되면 안 됨
```

✅ **집합 연산이 필요한 경우**
```dart
final set1 = {1, 2, 3};
final set2 = {2, 3, 4};
final intersection = set1.intersection(set2); // {2, 3}
final union = set1.union(set2); // {1, 2, 3, 4}
```

### Map을 사용하는 경우

✅ **키로 값을 찾아야 하는 경우**
```dart
final userScores = <String, int>{
  '철수': 85,
  '영희': 90,
};
final score = userScores['철수']; // 85
```

✅ **각 항목에 추가 정보가 필요한 경우**
```dart
final bookmarks = <int, BookmarkInfo>{
  2: BookmarkInfo(time: DateTime.now(), note: '맛있어요'),
  4: BookmarkInfo(time: DateTime.now(), note: '추천!'),
};
```

✅ **설정값이나 캐시를 저장하는 경우**
```dart
final settings = <String, dynamic>{
  'theme': 'dark',
  'language': 'ko',
  'notifications': true,
};
```

---

## 시간 복잡도 (Big O)

### List

| 연산 | 시간 복잡도 | 설명 |
|------|------------|------|
| `list[index]` | O(1) | 인덱스로 접근 |
| `list.add()` | O(1) | 끝에 추가 |
| `list.insert()` | O(n) | 중간에 삽입 (요소 이동 필요) |
| `list.contains()` | O(n) | 모든 요소 확인 |
| `list.remove()` | O(n) | 요소 찾아서 삭제 |
| `list.removeAt()` | O(n) | 인덱스로 삭제 (요소 이동 필요) |

### Set

| 연산 | 시간 복잡도 | 설명 |
|------|------------|------|
| `set.add()` | O(1) 평균 | 해시 테이블 기반 |
| `set.contains()` | O(1) 평균 | 매우 빠름! |
| `set.remove()` | O(1) 평균 | 빠른 삭제 |
| `set.union()` | O(n) | 합집합 |
| `set.intersection()` | O(n) | 교집합 |

### Map

| 연산 | 시간 복잡도 | 설명 |
|------|------------|------|
| `map[key]` | O(1) 평균 | 키로 값 찾기 |
| `map[key] = value` | O(1) 평균 | 추가/수정 |
| `map.containsKey()` | O(1) 평균 | 키 존재 확인 |
| `map.containsValue()` | O(n) | 모든 값 확인 |
| `map.remove()` | O(1) 평균 | 키로 삭제 |

### 성능 비교 예시

**100만 개의 데이터에서 검색:**

| 컬렉션 타입 | 연산 | 시간 |
|------------|------|------|
| List | `contains()` | ~100ms (O(n)) |
| Set | `contains()` | ~0.0001ms (O(1)) |
| Map | `containsKey()` | ~0.0001ms (O(1)) |

**결론:** 자주 검색하는 데이터는 Set이나 Map을 사용하는 것이 훨씬 효율적입니다!

---

## 요약

- **List**: 순서 있고 중복 허용, 인덱스 접근 가능
- **Set**: 중복 없음, 빠른 검색, 고유한 값 집합
- **Map**: 키-값 쌍, 키로 빠른 검색, 관련 데이터 저장

각 컬렉션 타입은 고유한 특성과 용도가 있으므로, 상황에 맞게 선택하는 것이 중요합니다! 🚀

