function openPopUp() {
    // 함수 동작 테스트 
    //alert("팝업 테스트");
    
    //window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
     window.open("/MyPage", "target", "width=800, height=700, top=150, left=200");
}

function showHidden() {
    alert(document.testForm.flag.value);
}