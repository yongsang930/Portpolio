
// dynamic에서 선택한 객체를 target에 저장 / 나는 공백으로 시작함
let target = document.querySelector("#dynamic");

    // 출력할 문자열들을 배열에 담고 
    // random함수를 선택된 문자열을 하나의 문자 단위의 배열로 만듦
    function randomString(){
        let stringArr = [
        "\"I am Groot.\"",
        "\"We are Groot.\"",
        "\"Come on! Spiderman!\"",
        "\"I am iron man.\"",
        "\"We lose together.\"",
        "\"I need a horse!\"",
        "\"I'm always angry.\"",
        "\"I've come to bargain.\"",
        "\"Did not expect?\""];
        // math.random을 통해 숫자를 random으로 생성하고 math.floor로 절삭
        // 임의의 숫자에 해당하는 문자열을 selectString에 담음
        let selectString = stringArr[Math.floor(Math.random() * stringArr.length)];

        // selectString을 하나의 문자식 잘라 문자 배열형태로 randomArr에 저장 후 리턴
        let randomArr = selectString.split("");

        return randomArr;
    }

// randomArr의 길이가 0보다 크면
function dynamic(randomArr){
    if(randomArr.length > 0){
        // randomArr의 제일 앞의 문자를 빼서 target의 text형태로 보냄 / 출력
        target.textContent += randomArr.shift();
        // 재귀함수를 이용 / setTimeout으로 시간간격을 두고 다시 호출하여 0보다 크지 않을때까지 실행
        setTimeout(function(){dynamic(randomArr)},300)
    }else{
        // 더이상 출력되는 문자열이 없을때는 resetTyping함수를 실행
        setTimeout(resetTyping, 3000);
    }
}


    // 타이핑 리셋
    // target의 text를 리셋하고 dynamic함수로 randomString함수를 호출하여 
    // randomArr을 매개변수로 받아 전체 알고리즘을 다시 반복
    function resetTyping(){
        target.textContent = "";
        dynamic(randomString())
    }


    dynamic(randomString())
    // 커서의 깜빡임 효과
    function blink(){
        target.classList.toggle("active");
    }
    setInterval(blink, 500);