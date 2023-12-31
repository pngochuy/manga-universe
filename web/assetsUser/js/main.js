/**
 * Template Name: NiceAdmin
 * Updated: Sep 18 2023 with Bootstrap v5.3.2
 * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */
(function () {
    "use strict";
    /**
     * Easy selector helper function
     */
    const select = (el, all = false) => {
        el = el.trim()
        if (all) {
            return [...document.querySelectorAll(el)]
        } else {
            return document.querySelector(el)
    }
    }

    /**
     * Easy event listener function
     */
    const on = (type, el, listener, all = false) => {
        if (all) {
            select(el, all).forEach(e => e.addEventListener(type, listener))
        } else {
            select(el, all).addEventListener(type, listener)
    }
    }

    /**
     * Easy on scroll event listener 
     */
    const onscroll = (el, listener) => {
        el.addEventListener('scroll', listener)
    }

    /**
     * Sidebar toggle
     */
    if (select('.toggle-sidebar-btn')) {
        on('click', '.toggle-sidebar-btn', function (e) {
            select('body').classList.toggle('toggle-sidebar')
        })
    }

    /**
     * Search bar toggle
     */
    if (select('.search-bar-toggle')) {
        on('click', '.search-bar-toggle', function (e) {
            select('.search-bar').classList.toggle('search-bar-show')
        })
    }

    /**
     * Navbar links active state on scroll
     */
    let navbarlinks = select('#navbar .scrollto', true)
    const navbarlinksActive = () => {
        let position = window.scrollY + 200
        navbarlinks.forEach(navbarlink => {
            if (!navbarlink.hash)
                return
            let section = select(navbarlink.hash)
            if (!section)
                return
            if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
                navbarlink.classList.add('active')
            } else {
                navbarlink.classList.remove('active')
            }
        })
    }
    window.addEventListener('load', navbarlinksActive)
    onscroll(document, navbarlinksActive)

    /**
     * Toggle .header-scrolled class to #header when page is scrolled
     */
    let selectHeader = select('#header')
    if (selectHeader) {
        const headerScrolled = () => {
            if (window.scrollY > 100) {
                selectHeader.classList.add('header-scrolled')
            } else {
                selectHeader.classList.remove('header-scrolled')
            }
        }
        window.addEventListener('load', headerScrolled)
        onscroll(document, headerScrolled)
    }

    /**
     * Back to top button
     */
    let backtotop = select('.back-to-top')
    if (backtotop) {
        const toggleBacktotop = () => {
            if (window.scrollY > 100) {
                backtotop.classList.add('active')
            } else {
                backtotop.classList.remove('active')
            }
        }
        window.addEventListener('load', toggleBacktotop)
        onscroll(document, toggleBacktotop)
    }

    /**
     * Initiate tooltips
     */
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })

    /**
     * Initiate quill editors
     */
    if (select('.quill-editor-default')) {
        new Quill('.quill-editor-default', {
            theme: 'snow'
        });
    }

    if (select('.quill-editor-bubble')) {
        new Quill('.quill-editor-bubble', {
            theme: 'bubble'
        });
    }

    if (select('.quill-editor-full')) {
        new Quill(".quill-editor-full", {
            modules: {
                toolbar: [
                    [{
                            font: []
                        }, {
                            size: []
                        }],
                    ["bold", "italic", "underline", "strike"],
                    [{
                            color: []
                        },
                        {
                            background: []
                        }
                    ],
                    [{
                            script: "super"
                        },
                        {
                            script: "sub"
                        }
                    ],
                    [{
                            list: "ordered"
                        },
                        {
                            list: "bullet"
                        },
                        {
                            indent: "-1"
                        },
                        {
                            indent: "+1"
                        }
                    ],
                    ["direction", {
                            align: []
                        }],
                    ["link", "image", "video"],
                    ["clean"]
                ]
            },
            theme: "snow"
        });
    }

    /**
     * Initiate TinyMCE Editor
     */
    const useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const isSmallScreen = window.matchMedia('(max-width: 1023.5px)').matches;
    tinymce.init({
        selector: 'textarea.tinymce-editor',
        plugins: 'preview importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap pagebreak nonbreaking anchor insertdatetime advlist lists wordcount help charmap quickbars emoticons',
        editimage_cors_hosts: ['picsum.photos'],
        menubar: 'file edit view insert format tools table help',
        toolbar: 'undo redo | bold italic underline strikethrough | fontfamily fontsize blocks | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
        toolbar_sticky: true,
        toolbar_sticky_offset: isSmallScreen ? 102 : 108,
        autosave_ask_before_unload: true,
        autosave_interval: '30s',
        autosave_prefix: '{path}{query}-{id}-',
        autosave_restore_when_empty: false,
        autosave_retention: '2m',
        image_advtab: true,
        link_list: [{
                title: 'My page 1',
                value: 'https://www.tiny.cloud'
            },
            {
                title: 'My page 2',
                value: 'http://www.moxiecode.com'
            }
        ],
        image_list: [{
                title: 'My page 1',
                value: 'https://www.tiny.cloud'
            },
            {
                title: 'My page 2',
                value: 'http://www.moxiecode.com'
            }
        ],
        image_class_list: [{
                title: 'None',
                value: ''
            },
            {
                title: 'Some class',
                value: 'class-name'
            }
        ],
        importcss_append: true,
        file_picker_callback: (callback, value, meta) => {
            /* Provide file and text for the link dialog */
            if (meta.filetype === 'file') {
                callback('https://www.google.com/logos/google.jpg', {
                    text: 'My text'
                });
            }

            /* Provide image and alt text for the image dialog */
            if (meta.filetype === 'image') {
                callback('https://www.google.com/logos/google.jpg', {
                    alt: 'My alt text'
                });
            }

            /* Provide alternative source and posted for the media dialog */
            if (meta.filetype === 'media') {
                callback('movie.mp4', {
                    source2: 'alt.ogg',
                    poster: 'https://www.google.com/logos/google.jpg'
                });
            }
        },
        templates: [{
                title: 'New Table',
                description: 'creates a new table',
                content: '<div class="mceTmpl"><table width="98%%"  border="0" cellspacing="0" cellpadding="0"><tr><th scope="col"> </th><th scope="col"> </th></tr><tr><td> </td><td> </td></tr></table></div>'
            },
            {
                title: 'Starting my story',
                description: 'A cure for writers block',
                content: 'Once upon a time...'
            },
            {
                title: 'New list with dates',
                description: 'New List with dates',
                content: '<div class="mceTmpl"><span class="cdate">cdate</span><br><span class="mdate">mdate</span><h2>My List</h2><ul><li></li><li></li></ul></div>'
            }
        ],
        template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
        template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
        height: 600,
        image_caption: true,
        quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
        noneditable_class: 'mceNonEditable',
        toolbar_mode: 'sliding',
        contextmenu: 'link image table',
        skin: useDarkMode ? 'oxide-dark' : 'oxide',
        content_css: useDarkMode ? 'dark' : 'default',
        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
    });
    /**
     * Initiate Bootstrap validation check
     */
    var needsValidation = document.querySelectorAll('.needs-validation')

    Array.prototype.slice.call(needsValidation)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })

    /**
     * Initiate Datatables
     */
    const datatables = select('.datatable', true)
    datatables.forEach(datatable => {
        new simpleDatatables.DataTable(datatable);
    })

    /**
     * Autoresize echart charts
     */
    const mainContainer = select('#main');
    if (mainContainer) {
        setTimeout(() => {
            new ResizeObserver(function () {
                select('.echart', true).forEach(getEchart => {
                    echarts.getInstanceByDom(getEchart).resize();
                })
            }).observe(mainContainer);
        }, 200);
    }



})();
/*---------------------------------- */

//const fileInput = document.getElementById("postImage");
//const imagePreview = document.getElementById("imagePreview");
//const removeImage = document.getElementById("removeImage");
//const postUrls = document.getElementById("postUrls");
//const submitButton = document.getElementById("submitButton");
//const uploadButton = document.getElementById("uploadButton");
//const spinnerUpload = document.getElementById("spinnerUpload");
//const feedback = document.getElementById('feedback');
//const progress = document.getElementById('progress');
//const progressLabel = document.getElementById('progress-label');
//const imageGrid = document.getElementById('image-grid');
//let isImageSelected = false;
//
//// Hàm để xử lý sự kiện khi người dùng chọn tệp
//function handleFileSelection(event) {
//    imagePreview.remove();
//    const files = event.target.files;
//    const totalFiles = files.length;
//    let uploadedFiles = 0;
//
//    // Hiển thị tiến trình ban đầu
//    progress.value = 0;
//    progressLabel.textContent = '0%';
//
//    for (let i = 0; i < files.length; i++) {
//        // Upload to Cloud ...
//        updateSubmitButtonState();
//        updateSpinnerUploadState();
//        const file = files[i];
//
//        if (file) {
//            const formData = new FormData();
//            formData.append("file", file);
//            formData.append("upload_preset", "demo_manga");
//
//            fetch("https://api.cloudinary.com/v1_1/djytvqlon/image/upload", {
//                method: "POST",
//                body: formData,
//            })
//                    .then((response) => response.json())
//                    .then((data) => {
//                        const reader = new FileReader();
//                        reader.addEventListener('progress', (event) => {
//                            if (event.lengthComputable) {
//                                const percentLoaded = (event.loaded / event.total) * 100;
//                                progress.value = (uploadedFiles + 1) / totalFiles * 100 + percentLoaded / totalFiles;
//                                progressLabel.textContent = `${Math.round(progress.value)}%`;
//                            }
//                        });
//                        reader.readAsDataURL(file); // Đọc tệp dưới dạng URL dữ liệu
//
//                        // Hiển thị ảnh đã tải lên
//                        const img = document.createElement('img');
//                        img.src = data.url;
//                        img.className = 'image-grid-item'; // Để thêm CSS tùy chỉnh
//                        imageGrid.appendChild(img);
//                        uploadedFiles++;
//
//                        // Thêm link vào input hidden
//                        const newInput = document.createElement("input");
//                        newInput.type = "hidden";
//                        newInput.name = "imageURL";
//                        newInput.className = "imageURL";
//                        newInput.value = data.url;
//                        postUrls.appendChild(newInput);
//
//                        isImageSelected = true;
//                        updateSubmitButtonState();
//                        updateSpinnerUploadState();
//                    })
//                    .catch((error) => {
//                        console.error("Error:", error);
//                    });
//        }
//    }
//}
//
//// Gắn kết sự kiện nghe cho nút upload
//uploadButton.addEventListener("click", function () {
//    fileInput.click(); // Khi nhấn nút "Upload", gọi sự kiện click cho input file
//});
//
//// Gắn kết sự kiện nghe cho input file để xử lý tệp được chọn
//fileInput.addEventListener("change", handleFileSelection);
//
//removeImage.addEventListener("click", function () {
//    fileInput.value = ''; // Xóa tên tệp đã chọn
//    fileInput.files = null; // Xóa danh sách tệp đã chọn
//
//    // Xóa tất cả ảnh trong imageGrid
//    while (imageGrid.firstChild) {
//        imageGrid.removeChild(imageGrid.firstChild);
//    }
//
//    // Xóa tất cả input hidden
//    while (postUrls.firstChild) {
//        postUrls.removeChild(postUrls.firstChild);
//    }
//
//    progress.value = 0;
//    progressLabel.textContent = '0%';
//    isImageSelected = false;
//    updateSubmitButtonState();
//    
//    // Tải lại trang web
//    location.reload();
//});
//
//function updateSubmitButtonState() {
//    if (isImageSelected) {
//        submitButton.removeAttribute("disabled");
//    } else {
//        submitButton.setAttribute("disabled", "disabled");
//    }
//}
//
//function updateSpinnerUploadState() {
//    if (isImageSelected) {
//        spinnerUpload.style.display = "none";
//    } else {
//        spinnerUpload.style.display = "inline-block";
//    }
//}




const fileInput = document.getElementById("postImage");
const imagePreview = document.getElementById("imagePreview");
const removeImage = document.getElementById("removeImage");
const postUrls = document.getElementById("postUrls");
const submitButton = document.getElementById("submitButton");
const uploadButton = document.getElementById("uploadButton");
const spinnerUpload = document.getElementById("spinnerUpload");
const feedback = document.getElementById('feedback');
const progress = document.getElementById('progress');
const progressLabel = document.getElementById('progress-label');
const imageGrid = document.getElementById('image-grid');
let isImageSelected = false;


uploadButton.addEventListener("click", function () {

    fileInput.addEventListener("change", function (changeEvent) {
        imagePreview.remove();

        const files = fileInput.files;
        // console.log(files);
        const totalFiles = files.length;
        let uploadedFiles = 0;
        // Hiển thị tiến trình ban đầu
        progress.value = 0;
        progressLabel.textContent = '0%';
        for (let i = 0; i < files.length; i++) {

            // Upload to Cloud ...
            updateSubmitButtonState();
            updateSpinnerUploadState();
            const file = changeEvent.target.files[i];
            // const file = changeEvent.target.files[0];
            if (file) {
                const formData = new FormData();
                formData.append("file", file);
                formData.append("upload_preset", "demo_manga");
                fetch("https://api.cloudinary.com/v1_1/djytvqlon/image/upload", {
                    method: "POST",
                    body: formData,
                })
                        .then((response) => response.json())
                        .then((data) => {
                            const reader = new FileReader();
                            reader.addEventListener('progress', (event) => {
                                if (event.lengthComputable) {
                                    const percentLoaded = (event.loaded / event.total) * 100;
                                    progress.value = (uploadedFiles + 1) / totalFiles * 100 + percentLoaded / totalFiles;
                                    progressLabel.textContent = `${Math.round(progress.value)}%`;
                                }
                            });
                            reader.readAsDataURL(files[i]); // Đọc tệp dưới dạng URL dữ liệu

                            // Hiển thị ảnh đã tải lên
                            const img = document.createElement('img');
                            img.src = data.url;
                            img.className = 'image-grid-item'; // Để thêm CSS tùy chỉnh
                            imageGrid.appendChild(img);
                            uploadedFiles++;
//                                if (uploadedFiles === totalFiles) {
//                                    // Tất cả tệp đã được tải lên
//                                    feedback.innerHTML = `Tất cả ${totalFiles} tệp đã được tải lên.`;
//                                }

                            // Thêm link vào input hidden

                            const newInput = document.createElement("input");
                            newInput.type = "hidden";
                            newInput.name = "imageURL";
                            newInput.className = "imageURL";
                            newInput.value = data.url;
                            postUrls.appendChild(newInput);
                            isImageSelected = true;
                            updateSpinnerUploadState();
                            updateSubmitButtonState();
                        })
                        .catch((error) => {
                            console.error("Error:", error);
                        });
            }

        }

    });
});
removeImage.addEventListener("click", function () {
    fileInput.files = null;

    var container = document.getElementById("image-grid");
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }

    const imgPreview = document.createElement('img');
    imgPreview.id = "imagePreview";
    imgPreview.src = "assetsUser/img/no_image.jpg";
    imgPreview.className = 'image-grid-item'; // Để thêm CSS tùy chỉnh
    imageGrid.appendChild(imgPreview);
    // postUrl.value = "";
    var container = document.getElementById("postUrls");
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }

    progress.value = 0;
    progressLabel.textContent = `0%`;
    fileInput.value = "";
    isImageSelected = true;
    updateSubmitButtonState();
});
function updateSubmitButtonState() {
    if (isImageSelected) {
        submitButton.removeAttribute("disabled");
    } else {
        submitButton.setAttribute("disabled", "disabled");
    }
}
function updateSpinnerUploadState() {
    if (isImageSelected) {
        spinnerUpload.style.display = "none";
    } else {
        spinnerUpload.style.display = "inline-block";
    }
}



