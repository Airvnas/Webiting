# Webiting
# 📖 친환경 가구 쇼핑몰 ECOFUN README

![image1](https://user-images.githubusercontent.com/108252049/214798624-51f911b7-32ff-4d3e-a534-ae1141535e66.PNG)
- 배포 URL : https://ohmycode-readme.netlify.app


<br>

## 프로젝트 소개

- ECOFUN은 eco funiture heaven의 줄임말로, 친환경 가구 쇼핑몰 프로젝트입니다.
- 쇼핑몰을 회원과 관리자의 입장에서 기능을 나눠 구현했습니다.
- 기존 쇼핑몰의 기능들을 최대한 구현해보고자 하였고  개인화추천, 인기상품추천, 결제 등 모두 구현했습니다.

<br>

## 팀원 구성

<div align="center">

| **구민수** | **김진엽** | **손예진** | 
| :------: |  :------: | :------: |
| [<img src="https://avatars.githubusercontent.com/u/106502312?v=4" height=150 width=150> <br/> @MinSu](https://github.com/KuMinSoo) | [<img src="https://avatars.githubusercontent.com/u/106502312?v=4" height=150 width=150> <br/> @JinYeop](https://github.com/Airvnas) |[<img src="https://avatars.githubusercontent.com/u/106502312?v=4" height=150 width=150> <br/> @YeJin](https://github.com/yeon1615) | 

</div>

<br>

## 1. 개발 환경

- Front : HTML, CSS, BootStrap4, JS, JSP, JQuery, Ajax
- Back-end : Java & Spring Framework, maven, mybatis, lombok, 
- Server: Tomcat 9.0.68
- Database : ORACLE
- API: NAVER CLOUD API, IMPORT API
- 버전 및 이슈관리 : Github, Github Issues, Github Project
- 협업 툴 : Discord, Notion, Github, SourceTree

<br>

## 2. 채택한 개발 기술과 브랜치 전략

### React, styled-component

- React
    - 컴포넌트화를 통해 추후 유지보수와 재사용성을 고려했습니다.
    - 유저 배너, 상단과 하단 배너 등 중복되어 사용되는 부분이 많아 컴포넌트화를 통해 리소스 절약이 가능했습니다.
- styled-component
    - props를 이용한 조건부 스타일링을 활용하여 상황에 알맞은 스타일을 적용시킬 수 있었습니다.
    - 빌드될 때 고유한 클래스 이름이 부여되어 네이밍 컨벤션을 정하는 비용을 절약할 수 있었습니다.
    - S dot naming을 통해 일반 컴포넌트와 스타일드 컴포넌트를 쉽게 구별하도록 했습니다.
    
### Recoil

- 최상위 컴포넌트를 만들어 props로 유저 정보를 내려주는 방식의 경우 불필요한 props 전달이 발생합니다. 따라서, 필요한 컴포넌트 내부에서만 상태 값을 가져다 사용하기 위해 상태 관리 라이브러리를 사용하기로 했습니다.
- Redux가 아닌 Recoil을 채택한 이유
    - Recoil은 React만을 위한 라이브러리로, 사용법도 기존의 useState 훅을 사용하는 방식과 유사해 학습비용을 낮출 수 있었습니다.
    - 또한 Redux보다 훨씬 적은 코드라인으로 작동 가능하다는 장점이 있었습니다.
- 로그인과 최초 프로필 설정 시 유저 정보를 atom에 저장하여 필요한 컴포넌트에서 구독하는 방식으로 사용했습니다.

### eslint, prettier

- 정해진 규칙에 따라 자동적으로 코드 스타일을 정리해 코드의 일관성을 유지하고자 했습니다.
- 코드 품질 관리는 eslint에, 코드 포맷팅은 prettier에 일임해 사용했습니다.
- airbnb의 코딩 컨벤션을 참고해 사용했고, 예외 규칙은 팀원들과 협의했습니다.
- 협업 시 매번 컨벤션을 신경 쓸 필요 없이 빠르게 개발하는 데에 목적을 두었습니다.

### 브랜치 전략

- Git-flow 전략을 기반으로 main, develop 브랜치와 feature 보조 브랜치를 운용했습니다.
- main, develop, Feat 브랜치로 나누어 개발을 하였습니다.
    - **main** 브랜치는 배포 단계에서만 사용하는 브랜치입니다.
    - **develop** 브랜치는 개발 단계에서 git-flow의 master 역할을 하는 브랜치입니다.
    - **Feat** 브랜치는 기능 단위로 독립적인 개발 환경을 위하여 사용하고 merge 후 각 브랜치를 삭제해주었습니다.

<br>

## 3. 프로젝트 구조

```
├── README.md
├── .eslintrc.js
├── .gitignore
├── .prettierrc.json
├── package-lock.json
├── package.json
│
├── public
│    └── index.html
└── src
     ├── App.jsx
     ├── index.jsx
     ├── api
     │     └── mandarinAPI.js
     ├── asset
     │     ├── fonts
     │     ├── css_sprites.png
     │     ├── logo-404.svg
     │     └── logo-home.svg
     │          .
     │          .
     │          .
     ├── atoms
     │     ├── LoginData.js
     │     └── LoginState.js
     ├── common
     │     ├── alert
     │     │     ├── Alert.jsx
     │     │     └── Alert.Style.jsx
     │     ├── button
     │     ├── comment
     │     ├── inputBox
     │     ├── post
     │     ├── postModal
     │     ├── product
     │     ├── tabMenu
     │     ├── topBanner
     │     └── userBanner
     ├── pages
     │     ├── addProduct
     │     │     ├── AddProduct.jsx
     │     │     └── AddProduct.Style.jsx
     │     ├── chatList
     │     ├── chatRoom
     │     ├── emailLogin
     │     ├── followerList
     │     ├── followingList
     │     ├── home
     │     ├── join
     │     ├── page404
     │     ├── postDetail
     │     ├── postEdit
     │     ├── postUpload
     │     ├── productEdit
     │     ├── profile
     │     ├── profileEdit
     │     ├── profileSetting
     │     ├── search
     │     ├── snsLogin
     │     └── splash
     ├── routes
     │     ├── privateRoutes.jsx
     │     └── privateRoutesRev.jsx  
     └── styles
           └── Globalstyled.jsx
```

<br>

## 4. 역할 분담
    
### 👻구민수

- **UI**
    - 회원게시판 CRUD 관련 페이지, 관리자게시판 CRUD 관련 페이지, 주문목록 페이지
    - 취소관리 페이지, 배송현황 페이지, 관리자/마이페이지 네비게이션
- **기능**
    - 게시판 (등록/삭제/수정/답글/파일업로드/비밀번호설정), 게시판 글등록시 유효성 검사, 게시판 검색기능, 페이지사이즈별 보기 및 페이징처리 
    - 아임포트 결제 API 구현(1차/2차 ), 주문목록 조건 검색(배송상태, 주문상태, 기간설정, 키워트 검색), 배송상태 변경, 취소상태 변경  

<br>

### 😎김진엽

- **UI**
    - 페이지 : splash 페이지, sns 로그인 페이지, 로그인, 회원가입
    - 공통 컴포넌트 : 상품 카드, 사용자 배너
- **기능**
    - splash 페이지, sns로그인 페이지, 로그인 유효성 및 중복 검사, 회원가입 유효성 및 중복 검사, 이메일 검증, 프로필 설정, 접근제한 설정

<br>

### 🐬손예진

- **UI**
    - 페이지 : 사용자 프로필 페이지
    - 공통 컴포넌트 : 탑배너, 하단 모달창
- **기능**
    - 팔로우 & 언팔로우, 로그아웃, 하단 모달창, 댓글 삭제, 게시글 삭제, 상품 삭제, 사용자 게시글 앨범형 이미지, 탑 배너 뒤로가기 버튼, Alert 모달
    
<br>

## 5. 개발 기간 및 작업 관리

### 개발 기간

- 전체 개발 기간 : 2022-12-19 ~ 2023-01-25


<br>

### 작업 관리

- 기능 구현에 따라 방향성에 대한 의논을 하고, 각자 맡은 파트를 Notion TeamSpace에 예정,진행중,완료로 나누어 팀원 모두 확인할 수 있게 했습니다.
- 강사님, 메토님의 피드백 사항을 노션에 저장해두고, 같이 회의를 하며 피드백받은 부분을 수정하고, 기능 추가 등의 작업을 했습니다.

<br>

## 6. 신경 쓴 부분

- [접근제한 설정](https://github.com/likelion-project-README/README/wiki/README-6.%EC%8B%A0%EA%B2%BD-%EC%93%B4-%EB%B6%80%EB%B6%84_%EC%A0%91%EA%B7%BC%EC%A0%9C%ED%95%9C-%EC%84%A4%EC%A0%95)

- [Recoil을 통한 상태관리 및 유지](https://github.com/likelion-project-README/README/wiki/README-6.%EC%8B%A0%EA%B2%BD-%EC%93%B4-%EB%B6%80%EB%B6%84_Recoil%EC%9D%84-%ED%86%B5%ED%95%9C-%EC%83%81%ED%83%9C%EA%B4%80%EB%A6%AC-%EB%B0%8F-%EC%9C%A0%EC%A7%80)

<br>

## 7. 페이지별 기능
## 회원기준

### [회원가입]
- 회원가입 페이지에 있는 내용을 모두 입력하고, 정규식에 위배되지 않는 조건의 내용일 때 회원가입이 가능하도록 유효성을 체크했습니다.
- 카카오로그인을 이용하기 위해서 이메일을 입력받았고, 카카오API를 통해 받아온 이메일과 비교해 일치할 경우 로그인이 완료되도록 구현했습니다.
- 정보이용 동의에 동의를 해야 회원가입이 가능합니다.

| 회원가입 |
|----------|
|![signup](https://user-images.githubusercontent.com/108252049/215317733-e92252ff-485e-4236-bdcd-3659a60327d4.png)|

<br>

### [로그인]
- 회원가입을 통한 정보에 일치하고, 카카오로그인 조건에 일치할 때 로그인이 가능합니다.

| 로그인 |
|----------|
|![login](https://user-images.githubusercontent.com/108252049/215317727-cb231776-9ad4-498f-961f-79ac6f89539d.png)|

<br>


### [카테고리 선택/ 정렬]
- 상단의 카테고리 메뉴를 선택해 원하는 상품들의 목록을 확인할 수 있고, 최신순,가격순 정렬을 할 수 있습니다.
    
| 카테고리 선택 |
|----------|
|![category](https://user-images.githubusercontent.com/108252049/215317723-46edff51-feb4-4507-9436-93ac2d4b9e99.png)|

<br>


### [검색]
- 상품명과 태그검색어를 통해 검색 할 수 있습니다.

| 검색 |
|----------|
|![search](https://user-images.githubusercontent.com/108252049/215317732-bce566a7-538b-4700-8cea-d0438c25ee83.png)|

<br>

### [상품 상세페이지]

- 상세페이지에서는 좋아요 버튼을 누를 수 있으며, 좋아요 버튼을 누르면 해당 상품이 관심상품목록에 추가되도록 구현했습니다.
- 개수를 선택하면 그에 따른 가격을 출력해주고, 장바구니, 주문하기 버튼을 통해 해당 페이지로 이동할 수 있습니다.

| 상품 상세페이지 |
|----------|
|![prodDetail](https://user-images.githubusercontent.com/108252049/215317729-ad250d15-8bd7-4756-8baf-4b264d492d6a.png)|

<br>


### [리뷰]

- 상품 이미지, 리뷰 내용, 상품 평가점수를 입력할 수 있고, 수정, 삭제가 가능합니다.

| 리뷰 |
|----------|
|![review](https://user-images.githubusercontent.com/108252049/215317731-48e0ab2d-6647-452f-960c-ec7e0975aa28.png)|

<br>

### [회원정보 수정]

- 회원의 정보가 출력되며, 정보 수정 후 수정하기 버튼을 누르면 회원의 정보가 수정됩니다.


| 회원정보 수정 |
|----------|
|![userInfoEdit](https://user-images.githubusercontent.com/108252049/215317735-97eb33fc-4e04-4178-9ac2-bab718991315.png)|

<br>

### [폐가구 수거 신청]

- 시청/구청으로의 신청은 구현되지 않았지만, 쇼핑몰의 확장성을 위해 폐가구의 종류, 사이즈를 입력받아 정보를 저장할 수 있습니다.

| 폐가구 수거 신청 |
|----------|
|![ditchProdAdd](https://user-images.githubusercontent.com/108252049/215317724-6f811485-912a-4c9a-9453-961747ab7d4a.png)|

<br>


### [폐가구 수거 신청 목록]
- 신청한 목록을 확인할 수 있고, 삭제할 수 있습니다.

| 폐가구 수거 신청 목록 |
|----------|
|![ditchProdList](https://user-images.githubusercontent.com/108252049/215317726-93534e6a-7e38-4461-926e-e9a3b8128ef6.png)|

<br>


### [결제하기]
- 결제는 아임포트 API로 설정했으며, 아임포트에서 요구하는 필수정보와 선택정보를 담아 Javascript에서 1차 전송할 수 있도록 했습니다.
- 이후 아임포트의 결제번호를 이용해 JAVA 컨트롤러에서 2차 전송하며, 1차/ 2차 검증을 통해 총 결제금액이 참일 경우 DB에 저장할 수 있도록 구성했습니다.

| 결제하기 |
|----------|
|![결제](https://user-images.githubusercontent.com/116619009/215628569-566f73eb-92af-4b98-99d8-278adfdc612c.png)|



<br>


### [고객게시판 홈화면]
- 고객게시판에서는 ‘자주 묻는 질문’을 카테고리별로 나눴고 해당 버튼을 클릭하면 질문에 대한 답을 볼 수 있도록 처리했습니다.
- 만약 다른 카테고리로 이동을 하게 되면 전에 열렸던 질문에 대한 답들은 ‘자동 숨김’ 처리됩니다.
- 게시판 등록 또는 리스트로 바로 갈 수 있는 버튼을 만들었습니다

| 고객게시판 홈화면 |
|----------|
|![회원게시판 홈화면](https://user-images.githubusercontent.com/116619009/215472618-045c9738-175b-41fb-b751-9a4e431ace24.png)|

<br>

### [고객문의 글등록]
- 문의유형별 선택하여 글을 등록할 수 있으며 이름, 제목, 비밀번호, 공개 체크 여부 중 하나라도 작성하지 않으면 글 등록이 되지 않도록 처리했습니다.
- 파일은 고객이 원하면 업로드해서 등록할 수 있도록 했습니다.
- 비밀번호는 글을 삭제하거나 수정하거나 비밀글 설정할때 해당 비밀번호를 입력해야 볼 수 있도록 하는 역할을 합니다.

| 고객문의 글등록 |
|----------|
|![회원게시판 글쓰기](https://user-images.githubusercontent.com/116619009/215473759-63cc39aa-5aef-4fff-86a6-bed7e1409636.png)|

<br>

### [게시글 편집하기 / 삭제하기]
- 해당 글 비밀번호를 입력해야 글을 수정할 수 있고 글 등록과 마찬가지로 이름, 제목 등 입력해야 글을 작성할 수 있도록 했습니다.
- 제목 또는 이름을 빈 공백 또는 스페이스바로 공백 처리하여 입력할 경우 글 등록할 수 없게 처리했습니다.
- 기타 파일 변경, 비밀번호, 공개 글 여부 또한 변경 가능합니다.
- 삭제하기는 해당 비밀번호를 입력하고 일치하면 삭제가능합니다.

| 게시글 편집하기 / 삭제하기 |
|----------|
|![회원글 수정삭제](https://user-images.githubusercontent.com/116619009/215500838-08a7749f-953a-44db-8e4c-895ec3317631.png)|

<br>

### [게시글 목록]
- 페이지 사이즈별로 [5, 10, 15, 20] 개씩 볼 수 있으며, 만약 검색어를 입력하고 사이즈를 변경할 경우 해당 검색어에 반영하여 페이지 사이즈가 달라집니다.
- 페이지 사이즈 기준으로 페이징 처리했으며 페이지 블록 개수가 5개를 초과하면 [Next] 페이지 버튼이 생기며, 누르면 현 페이지 블록의 마지막 페이지 기준에서 다음 페이지로 넘어갈 수 있도록 처리했습니다.
- 고객이 게시글을 등록하면 관리자 공지사항보다 아래 순번으로 들어갈 수 있도록 했습니다.

| 게시글 목록 |
|----------|
|![회원게시판 목록](https://user-images.githubusercontent.com/116619009/215499629-dd880f37-84b8-47be-be32-a1dbdf197c1e.png)|

<br>


## 관리자 기준
### 좌측의 관리자 메뉴를 통해 원하는 작업을 선택할 수 있습니다.
#### 1. 상품 등록
- 상품 이미지, 상품명, 가격 등 상품의 정보를 입력합니다.


| 상품 등록 |
|----------|
|![prodAdd](https://user-images.githubusercontent.com/108252049/215317728-70535a55-969e-4d6d-98b0-845908005cb5.png)|

<br>


#### 2. 상품 수정 및 삭제
- 계정이 관리자 계정이라면 상품 목록에 수정|삭제 버튼이 활성화되며, 수정 클릭시 수정폼으로 이동하고, 삭제 클릭시 해당 상품이 삭제됩니다.

| 상품 수정 & 삭제 |
|----------|
|![prodEditDel](https://user-images.githubusercontent.com/108252049/215317730-36e0de43-a354-4601-885b-33756aff72d5.png)|

<br>


#### 3. 주문목록
- 주문목록 페이지에서는 주문한 결제에 대한 정보를 볼 수 있으며 배송상태, 주문 상태, 기간 설정, 검색유형에 맞는 키워드에 조건을 맞춰 조회 가능합니다.
- 좀 더 자세히 설명하자면 배송상태와 주문상태는 필수적으로 체크를 해야 되며, 기간 설정 및 키워드 검색은 선택사항임. 만약 구체적인 상세기간을 설정하고 싶으면 해당 버튼을 클릭하고 설정하면 됩니다.
- 조회한 이후에도 관리자가 클릭한 조건들을 정보를 기억하고 다시 체크해서 보여줍니다.
- 상품명을 클릭하면 제품 상세페이지로 넘어가고 고객 아이디를 클릭하면 해당 고객의 기본정보 페이지가 나옴. 그리고 페이지 사이즈별로 선택해서 주문목록을 볼 수 있으며 페이지 사이즈 기준으로 페이지 처리합니다.

| 주문목록 |
|----------|
|![주목목록](https://user-images.githubusercontent.com/116619009/215464431-8124e4eb-b663-458a-8168-ca231a8af7c1.png)|

<br>

#### 4. 배송관리
- 배송관리도 주문목록과 같이 조건을 걸어 표현할 수 있음. 배송처리 필드에 있는 배송버튼을 누르면 배송상태가 변경됩니다. 
- 예를 들면, [배송대기] -> 클릭 ->[배송중] -> 클릭 -> [배송완료] 순으로 변경됩니다
- 배송상태에서 ‘배송대기’나 ‘배송중’ 조건을 걸고 조회를 하면 전체선택 또는 원하는 주문 건수를 선택하는 체크박스가 나오며 해당 버튼을 눌러 일괄적으로 배송처리를 할 수 있습니다.

| 배송관리 |
|----------|
|![배송관리](https://user-images.githubusercontent.com/116619009/215466156-8117c842-7a4f-4950-9869-28952339adbb.png)|

<br>

#### 5. 취소관리
- 취소관리에서는 고객이 취소 신청한 목록과 고객의 취소신청이 없는 물품 또한 관리자 권한으로 취소를 할 수 있도록 구성하고 취소신청은 버튼 또는 체크박스를 통해 일관적으로 할 수 있습니다.
- 고객의 취소신청이 없는 상태에서 취소처리를 하려면 주문상태의 ‘주문완료’ 조건을 체크하고 조회를 한 후 취소상태 아래에 있는 ‘주문완료’ 버튼 또는 체크박스를 통해 원하는 상품을 일괄적으로 취소할 수 있습니다.
- 고객이 취소 신청한 물품을 처리하고 싶으면 ‘취소/환불대기’ 조건을 체크하고 조회를 함. 그 이후 취소 사유를 클릭해서 해당 사유를 확인도 가능하며, 해당 상품을 버튼 또는 체크박스를 통해 일괄적으로 취소 처리할 수 있습니다.

| 취소관리 |
|----------|
|![취소관리](https://user-images.githubusercontent.com/116619009/215466558-43866caa-12c0-4f99-ab19-8d0e0d818374.png)|

<br>

#### 6. 관리자 게시판 / 공지사항
- 관리자 게시판에서는 공지사항 작성, 고객문의 답변, 삭제가 가능함. 먼저, 공지사항 작성시 관리자 글을 우선순위가 높아 고객이 등록한 글보다 상단에 위치시킵니다.
- 관리자는 비밀글 설정한 고객의 글 전부를 공개처리로 전환되어 볼 수 있습니다.
- 그 외 다른 기능(검색기능, 페이지사이즈별 목록 처리, 페이징처리 등)들은 일반게시판과 동일하게 기능할 수 있도록 처리했습니다.

| 관리자 게시판 / 공지사항 |
|----------|
|![관리자 게시판 목록](https://user-images.githubusercontent.com/116619009/215504937-688a64b7-a4a1-422c-a15d-bd5797264573.png)|

<br>

#### 7. 관리자 게시판 답글
- 고객이 등록한 문의 글에 답변 가능함. 만약 답변시 해당 글이 비공개일 경우 자동으로 비공개로 답변 처리되며, 해당 답변 글의 비밀번호는 고객이 문의한 작성글에 입력한 비밀번호와 동일하게 설정했습니다. 
- 이에 본인이 글 작성시 입력한 비밀번호와 일치해야 해당 답변글을 볼 수 있도록 했습니다

| 관리자 게시판 / 공지사항 |
|----------|
|![관리자 답글달기](https://user-images.githubusercontent.com/116619009/215505928-ad007fd1-3247-4349-9d0d-b4b2b7399cbf.png)|
|![관리자 답글달기2](https://user-images.githubusercontent.com/116619009/215506668-1708fe0a-fc4f-4431-9c6f-a07964c52dea.png)|

<br>



## 8. 트러블 슈팅

- [탭메뉴 프로필 버튼 이슈](https://github.com/likelion-project-README/README/wiki/README-8.%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_%ED%83%AD%EB%A9%94%EB%89%B4-%ED%94%84%EB%A1%9C%ED%95%84-%EB%B2%84%ED%8A%BC-%EC%9D%B4%EC%8A%88)

- [프로필 수정 이슈](https://github.com/likelion-project-README/README/wiki/README-8.%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_%ED%94%84%EB%A1%9C%ED%95%84-%EC%88%98%EC%A0%95-%EC%9D%B4%EC%8A%88)

<br>

## 9. 개선 목표

- API 모듈화 : API를 불러오는 코드의 반복이 많아 모듈화할 예정
- lighthouse Performance 증진
    - 모든 페이지에서 특히 Best Practices & SEO 점수는 90~100으로 우수
    - Performance 점수가 대체적으로 미흡한 문제
    
    ![KakaoTalk_Photo_2023-01-04-16-55-30](https://user-images.githubusercontent.com/112460466/210591134-09bf8efd-3c34-4b99-a3d7-895ca99e1457.png)
    
- **23-01-17 성능 개선 내용**
    
    ![성능개선 후](https://user-images.githubusercontent.com/106502312/212872369-7ceeb2cf-d551-41d2-bfb0-01e35e9903fe.png)
    
    - 이미지 최적화
        - `<img>` 요소에 `width` , `height` 속성값을 명시해 불필요한 Reflow를 방지했습니다.
        - browser-image-compression 라이브러리를 사용해 유저가 업로드하는 이미지를 압축했습니다.
        - Intersection Observer API를 사용해 Lazy Loading 기법을 적용하여 홈 피드의 게시글 이미지가 viewport 내에 들어오는 순간 로딩되도록 변경했습니다.
    - 웹폰트 최적화
        - WOFF2 포맷을 추가하고 가장 우선적으로 적용되도록 선언했습니다.
        - 서브셋 폰트로 교체해 용량을 줄였습니다.
    
<br>

## 10. 프로젝트 후기

### 👻 구민수

  프로젝트를 마무리하면서 백엔드 관련 코딩하기 전에 먼저 선행되어야 할 작업이 있다는 것을 깨달았습니다. 선행되어야 하는 작업 첫 번째로는 프로그램 UI의 전체적인 틀을 먼저 구성하는 것과 두 번째 해당 프로젝트의 시나리오를 미리 만들어 보는 것, 세 번째는 이에 필요한 DB 구조와 테이블을 구성하는 것입니다. 그리고 이 모든 것이 잘 구성되어야 코딩을 할 때 좀 더 편하게 할 수 있고 모든 팀원이 해당 프로젝트에 대해 더 잘 이해할 수 있다는 것을 알게 되었습니다. 하지만 프로젝트를 처음 만드는 과정이기에 부딪치면서 이것저것 하면서 배울 수 밖에 없었지만 다음에 또 프로젝트를 진행한다면 전체적인 틀과 구성에 대해 미리 점검하고 치밀하게 고민 필요가 있다는 것을 느꼈습니다. 그리고 무엇보다 같이 소통하면서 각자의 업무를 충실하게 진행한 팀원들이 있었기에 기한 안에 표현하고자 한 필수적인 기능을 모두 표현할 수 있었습니다.

<br>

### 😎 김진엽

 혼자하는 코딩 작업은 익숙했지만 팀 단위로 진행되는 프로젝트는 처음 경험해봤습니다.이 과정을 통해서 코드작성은 필수이고 협동을 위해 사용하는 여러가지 Tool을 사용하고, 맡은 파트에 대해 팀원들에게 설명하는것 등 개발자는 자기 혼자 잘하는 것보다 팀원과의 의사소통, 협동심이 중요하다는 것을 깨달았습니다. 수업에서 배운 내용을 모두 프로젝트 내에서 반영하고 기성 쇼핑몰들의 기능을 모두 구현해보고자 하였고, 프로젝트를 통해서 기본기를 탄탄하게 만들어보자는 의견을 팀원들 모두 받아들여 기본에 충실한 결과물을 얻을 수 있었습니다. 프로젝트를 끝까지 함께 진행한 팀원들에게 감사합니다!
 처음 팀장의 역할을 맡았기 때문에 프로젝트를 잘 마무리해야한다는 생각이 커 처음부터 급하게 진행하려 했었습니다. 그래서 처음 설계단계에서 꼼꼼하게 체크하지 못한 UI설계가 아쉽게 느껴집니다. 설계 단계에서의 체크하지 못한 점들을 해결하고자 시간을 들여 마무리 단계에서 진행을 했고, 이것을 처음부터 잘 설계했다면 더욱 완성도 높은 UI를 구현할 수 있었을 것이라 생각합니다. 이 점을 잊지않고, 다음 프로젝트에서는 초반 단계의 설계를 더욱 꼼꼼하게 임해야겠습니다.

<br>

### 🐬 손예진

컨벤션을 정하는 것부터 Readme 파일 작성까지 전 과정을 진행하려니 처음 생각보다 많은 에너지를 썼어요. 좋은 의미로 많이 썼다기보다, 제 능력을 십분 발휘하지 못해서 아쉬움이 남는 쪽입니다. 개발한다고 개발만 해서는 안 된다는 것을 몸소 느껴보는 기간이었던 것 같습니다. 이번 기회로 프로젝트를 진행하면서, 제가 잘하는 점과 부족한 점을 확실하게 알고 가는 건 정말 좋습니다. 기술적인 부분에 있어서는 리액트의 컴포넌트화가 주는 장점을 알았습니다. 조금 느린 개발이 되었을지라도 코드 가독성 부분에 있어서 좋았고, 오류가 발생해도 전체가 아닌 오류가 난 컴포넌트와 근접한 컴포넌트만 살펴보면 수정할 수 있는 부분이 너무 편했습니다. 모두 고생 참 많으셨고 리팩토링을 통해 더 나은 프로젝트 완성까지 화이팅입니다.
