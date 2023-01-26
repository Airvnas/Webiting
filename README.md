# Webiting
# :leaves: 친환경 가구 쇼핑몰 ECOFUN

![image1](https://user-images.githubusercontent.com/108252049/214798624-51f911b7-32ff-4d3e-a534-ae1141535e66.PNG)

<br>

## 프로젝트 소개

- ECOFUN은 친환경 가구 쇼핑몰입니다.
- 홈페이지의 기본적인 CRUD 기능을 갖추고 있습니다.
- 다른 쇼핑몰들과 차별점을 두기 위해 naver aitems를 이용해서 사용자별 추천 시스템을 추가했습니다.

<br>

## 팀원 구성

<div align="center">

| **김진엽** | **구민수** | **김경회** | **손예진** |
| :------: |  :------: | :------: | :------: |
| [<img src="https://avatars.githubusercontent.com/u/106502312?v=4" height=150 width=150> <br/> @yeon1615](https://github.com/yeon1615) | [<img src="https://avatars.githubusercontent.com/u/112460466?v=4" height=150 width=150> <br/> @Cheorizzang](https://github.com/Cheorizzang) | [<img src="https://avatars.githubusercontent.com/u/112460506?v=4" height=150 width=150> <br/> @heejiyang](https://github.com/heejiyang) | [<img src="https://avatars.githubusercontent.com/u/76766459?v=4" height=150 width=150> <br/> @journey-ji](https://github.com/journey-ji) |

</div>

<br>

## 1. 개발 환경
- MainLanguage :  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
- IDE : STS 3.X
- Framework : Spring
- Front : HTML, BootStrap
- Database : oracle DB(11xe)
- WAS : TOMCAT 8.0
- 버전 및 이슈관리 : Github, Source Tree
- 협업 툴 : Discord, Notion
<br>


## 4. 역할 분담

### 🍊 손예진

- **마이 페이지**
    - 장바구니, 관심 상품 목록 페이지
    - 결제, 주문 내역 조회 페이지
    - 매출 통계 페이지
- **관리자 페이지**
    - 회원 조회/수정
    - 매출 통계 페이지

<br>
 
## 5. 개발 기간 및 작업 관리

### 개발 기간

- 전체 개발 기간 : 2022-12-19 ~ 2022-01-25
- WBS
![image](https://user-images.githubusercontent.com/56148268/214805377-123d98b3-9d61-481d-97a9-0feca1acb3e8.png)


<br>

### 작업 관리

- GitHub Source Tree와 Notion을 사용하여 진행 상황을 공유했습니다.
- 주간회의를 진행하며 코드를 병합하고 작업 순서와 방향성에 대한 고민을 나누고 Notion에 회의 내용을 기록했습니다.

<br>

## 7. 페이지별 기능

### [관리자 페이지]
- 유저들의 정보를 조회, 수정할 수 있도록 하였습니다.

| 유저 정보 검색, 수정 |
|----------|
|![회원정보수정](https://user-images.githubusercontent.com/56148268/214812304-1d4257b9-87fc-45ee-be29-cf09d0d4fc5c.PNG)|

<br>

### [마이페이지 - 관심 상품 목록]
- 제품 상세페이지에서 좋아요 버튼을 누르면 회원의 관심목록에 제품이 저장됩니다.
- 체크박스를 이용해서 삭제하거나 장바구니로 이동할 수 있습니다.

| 관심 상품 목록 |
|----------|
|![관심상품목록](https://user-images.githubusercontent.com/56148268/214812317-117d4f27-651f-4da7-94b6-f6af63bad5fe.PNG)|

<br>

### [장바구니]
 - 구매 예정인 물품을 장바구니로 옮길 수 있습니다.
 
| 장바구니 |
|----------|
|![장바구니](https://user-images.githubusercontent.com/56148268/214812320-e19b2341-d5e2-463d-929f-5e9fd65c1c3a.PNG)|

<br>

### [주문, 취소 내역 확인]
 - 로그인한 회원의 주문 내역을 리스트에 저장해서 보여줍니다.
 
| 주문 내역 |
|----------|
|![주문내역](https://user-images.githubusercontent.com/56148268/214812328-9f728c32-9a06-4407-b0b9-6ab065c8a642.PNG)|

<br>

 - 상세 주문 내역보기를 누르면 주문번호와 매핑되는 정보를 출력해서 보여줍니다.
 
| 상세 주문 내역보기 |
|----------|
|![상세주문내역](https://user-images.githubusercontent.com/56148268/214813713-db4b6e17-84f1-43ae-a54c-e8a6294258a8.PNG)|

<br>
 
 - 주문 취소/환불하기를 누르면 환불사유를 선택해 취소 신청을 할 수 있습니다.
 
| 주문 취소/환불하기 |
|----------|
|![주문취소신청](https://user-images.githubusercontent.com/56148268/214813720-f9fbce38-ff76-483a-ba51-185772f652da.PNG)|
 
<br>

 - 취소한 내역들은 취소/환불 내역에서 확인할 수 있습니다.
 
| 취소, 환불 내역 |
|----------|
|![취소환불내역](https://user-images.githubusercontent.com/56148268/214812336-bc7ffa0d-56ea-4510-accb-67dd383cb3d3.PNG)|

<br>

### [연도별 구매내역-마이페이지]
 - 구글 차트를 이용해 회원별로 연도별 구매내역을 확인할 수 있게 하였습니다.
 
| 연도별 구매내역 |
|----------|
|![연도별구매내역](https://user-images.githubusercontent.com/56148268/214814545-852bc191-50d4-4ba9-be65-845cd5fceeb2.PNG)|

<br>

### [매출 통계-관리자 페이지]
 - 구글차트를 이용해서 테이블에 저장된 데이터들을 출력해보았습니다.
 
| 회원 성별, 나이대 비율 |
|----------|
|![성별나이대](https://user-images.githubusercontent.com/56148268/214815255-c6cdbe26-dc84-44f6-9a96-351cf6e3bd76.PNG)|

| 제일 많이 팔린 가구 Best 10 |
|----------|
|![Best10](https://user-images.githubusercontent.com/56148268/214815267-1e235c6d-0e76-4bfe-9070-c9a043ada4de.PNG)|

| 연도별 공급가, 판매가, 순이익 확인 |
|----------|
|![순이익통계](https://user-images.githubusercontent.com/56148268/214815275-e6fde2ff-4ec1-49f2-8608-19f8c2cb43d6.PNG)|

| 설정한 연도의 월별 총매출액 확인 |
|----------|
|![연도별월매출](https://user-images.githubusercontent.com/56148268/214815286-643b520d-5739-43df-b68c-9029e606663b.PNG)|
<br>


## 10. 프로젝트 후기

### 🍊 손예진

이번 프로젝트로 제가 할 수 있는 것과 아직은 더 배워야하는 곳을 알 수 있었고 또 프로젝트를 진행할 때 어떻게 진행하면 좋을지 알게됐습니다. 정말 큰 배움을 얻고 갑니다.
초기 세팅 부족이나 기능 구현을 좀 더 완벽하게 하지않은 아쉬움이 있지만
그래도 계획했던 큰 기능들은 다 구현하고 마주한 이슈들을 해결해서 이번 프로젝트를 마친 것이 뿌듯합니다.
앞으로도 계속 전문성을 기르고 멋진 개발자가 되고 싶습니다. 웹이팅 팀원분들 고생하셨습니다!
