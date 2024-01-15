console.log("boardComment In.");
console.log(bnoVal);

document.getElementById('cmtPostBtn').addEventListener('click', () => {

    const cmtText = document.getElementById('cmtText');
    if(cmtText.value == null || cmtText.value == '')
    {
        alert('댓글의 내용이 없습니다.');
        cmtText.focus;
        return false;
    }
    
})