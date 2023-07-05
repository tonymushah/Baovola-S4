window.addEventListener('load', () => {
    let menu = document.querySelector('.menu');
    let burger = document.querySelector('.nav-burger');
    let navbar = document.querySelector('.navbar');
    let menuClass = menu.classList 
    burger.addEventListener('click', () => {
        if(menuClass.contains('display')) {
            menuClass.remove('display')
            navbar.classList.remove('navOpen')
        }
        else {
            menuClass.add('display')
            navbar.classList.add('navOpen')
        }
    }) 
})