# SOL2.0 UI Demo Project

### Spec

> Backend : Supabase

- Supabase CLI, 도커이미지를 설치하고 로컬에서 머신 구동
  `supabase init`

  `supabase start`

> Frontend : Flutter

- 폴더구조
  1. Data
     - datasource
     - model
     - repository impl
  2. Domain
     - entity
     - repository
     - usecase
  3. Presentation
     - pages
     - router
- 주요 라이브러리
  - supabase_flutter : Supabase Dart SDK
  - freezed : DTO 생성
  - build_runner : 코드 자동생성
  - injectable, get_it : 의존성 주입
  - go_router : 라우팅 처리
  - flutter_bloc : 전역 상태관리
