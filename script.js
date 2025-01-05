const sideNav = document.querySelector('.side-nav');
const toggleBtn = document.getElementById('toggle-btn');
const navItems = document.querySelectorAll('.nav-item');
const siteName = document.getElementById('site-name');
const pageTitle = document.getElementById('page-title');

// Toggle side nav
toggleBtn.addEventListener('click', () => {
    sideNav.classList.toggle('expanded');
});

// Update active item, site name, and page title
navItems.forEach(item => {
    item.addEventListener('click', () => {
        // Remove "active" class from all nav items
        navItems.forEach(nav => nav.classList.remove('active'));

        // Add "active" class to clicked item
        item.classList.add('active');

        // Update site name in the top bar
        const siteNameText = item.getAttribute('data-site-name');
        siteName.textContent = siteNameText;

        // Update page title in the content container
        pageTitle.textContent = `Welcome to ${siteNameText}`;
    });
});
