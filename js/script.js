document.addEventListener("DOMContentLoaded", function() {
    const menuToggle = document.getElementById("hamburger-menu");
    const nav = document.querySelector("nav-h"); // Alteração aqui
    
    if (menuToggle && nav) {
        menuToggle.addEventListener("click", function() {
            nav.classList.toggle("nav-open");
        });
    } else {
        console.error("Não foi possível encontrar o elemento do menu de hambúrguer ou do menu de navegação.");
    }
});
