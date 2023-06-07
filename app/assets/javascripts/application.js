//= require highcharts
//= require jquery
//= require jquery-ui
//= require code.highcharts
//= require bootstrap.min
//= require bootstrap.bundle.min
// 获取所有链接
const links = document.querySelectorAll(".links a");

// 遍历每个链接
links.forEach((link, index) => {
  // 给第一个链接添加激活状态
  if (index === 0) {
    link.classList.add("active-link");
  }

  // 给每个链接添加点击事件监听器
  link.addEventListener("click", (event) => {
    event.preventDefault(); // 防止链接跳转

    // 移除所有链接的激活状态
    links.forEach((link) => {
      link.classList.remove("active-link");
    });

    // 给当前点击的链接添加激活状态
    link.classList.add("active-link");
  });
});

