// 10개의 이미지 string을 배열로 받아옴 
let img = ["pic1.jpg","pic2.jpg","pic3.jpg","pic4.jpg","pic5.jpg","pic6.jpg","pic7.jpg","pic8.jpg","pic9.jpg","pic10.jpg"];

let number_picked = [];
let number_random = 0;
let temp = 0;

// 배열을 섞음
for(let i=0; i < img.length; i++ ){
    number_random = (Math.floor(Math.random()*img.length));

    temp = img[i];
    img[i] = img[number_random];
    img[number_random] = temp;

};
console.log(img);
console.log("--------------------")

// img배열에서 맨 앞의 요소를 number_picked에 저장하고 
number_picked = img[0];
img.shift();
img.sort();

console.log("추천상품: "+number_picked);
console.log(img);
console.log("--------------------")

const imgSet = document.querySelectorAll(".carousel-slide img");

console.log(imgSet);

imgSet[0].src = number_picked;
imgSet[11].src = img[0];

console.log(img);
for(let i=0; i > img.length; i++){
    imgSet[i].src = img[i];
}

for(let i=0; i < imgSet.length;i++){
    console.log(i+" "+imgSet[i].src);
}