롤 챔피언 지도 다시만드려고 시작한 프로젝트

과거 파이썬+javascript로 만들었던 사이트:
https://limitless-oasis-92034.herokuapp.com/tool2/#search_result

챔피언 얼굴 이미지로 표시하고싶었다.

Stack에서 Align을 주어 좌표지정하였다.
겹치는 챔피언이 있는 좌표는 새로운 마커를 넣어서 여러명을 표시하려고 했는데,

세라핀부터 ddragon(http://ddragon.leagueoflegends.com/cdn/11.18.1/data/en_US/champion.json)
info 데이터를 제대로 업데이트해주지않아서 흥미가사라졌다.
사미라까지만 원하는 모습대로 제대로 나오고 세라핀부터는 다 0,0,0에 존재하겠지

겹치는 챔피언 표시는 흥미가 다시 생기면 해보려고한다.
info 데이터 대신 stats를 이용해서 롤인벤처럼(https://lol.inven.co.kr/dataninfo/champion/compare.php)
새로운 값들을 이용해서 지도를 다시 만들까했지만, criti이 뭔지, attackdamage는 mp한테도 적용되는 되는값인지 알 수 없고 잘 모르겠다.

한데까지 이미지:
![롤챔피언지도](https://user-images.githubusercontent.com/32862869/133745805-79f85767-8de0-4036-a4c2-d3bc7b088bee.PNG)
