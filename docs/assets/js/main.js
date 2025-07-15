
window.onload = load();
function load() {
  updateLinkTargets();
}



// open external links and pdfs in new tab
function updateLinkTargets() {
  // let siteUrl = 'docs.ethstaker.org';
  let siteUrl = 'https://ethstaker-docs-preview.netlify.app';
  // let siteUrl = 'http://127.0.0.1:8000/';
  document.querySelectorAll('a').forEach(link => {
    let href = link.href;
    // set all links to open in new tab
    if (/^(https?:)?\/\//.test(link.href)) {
      link.target = '_blank';
    }
    // if current domain, use same tab
    if (href != undefined && href.includes(siteUrl)) {
      link.target = '_self';
    }
    // if relative links, use same tab
    if (href != undefined && !href.includes('https')) {
      link.target = '_self';
    }
    // open all .pdf, .png, .jpg, .mp4 in new tab
    if (/(\.pdf$|\.png$|\.jpe?g$|\.mp4)/.test(href)) {
      link.target = '_blank';
    }
    // if new-tab class, use new tab
    if (link.classList.contains('new-tab')) {
      link.target = '_blank';
    }
  })
}
