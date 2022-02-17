import "summernote/dist/summernote-bs4.min.js";
import "summernote/lang/summernote-ja-JP.js";
import "summernote/dist/summernote-bs4.min.css";

export function summernote(): void {
    $('.js-summernote').summernote({
        height: 600,
        lang: 'ja-JP', /*日本語対応*/
        toolbar: [
            ['para', ['style', 'ul', 'ol', 'paragraph']],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['insert', ['link', 'table', 'picture', 'video']],
            ['misc', ['codeview']]
        ],
        popover: {
            image: [
                ['custom', ['imageTitle', 'captionIt']],
                ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
                ['float', ['floatLeft', 'floatRight', 'floatNone']],
                ['remove', ['removeMedia']]
            ],
            link: [
                ['link', ['linkDialogShow', 'unlink']]
            ],
            table: [
                ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
                ['delete', ['deleteRow', 'deleteCol', 'deleteTable']]
            ],
            air: [
                ['color', ['color']],
                ['font', ['bold', 'underline', 'clear']],
                ['para', ['ul', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']]
            ]
        },
        cleaner: {
            action: 'paste',
            newline: '<br>',
            keepClasses: true,
        },
        imageTitle: {
            specificAltField: true,
        },
        callbacks: {
            onImageUpload: function(files) {
                const $this = $(this);
                const formData = new FormData();
                formData.append("editor_upload_image[image]", files[0]);
                $.ajax({
                    url: '/admin/api/editor_upload_images',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function(data){
                        $this.summernote("insertImage", data.location, function ($image) {
                            $image.css('width', 'auto');
                        });
                    }
                });
            },
            onPaste: function (e) {
                const bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                e.preventDefault();
                document.execCommand('insertText', false, bufferText);
            }
        }
    });
    $('.js-summernote_ul').summernote({
        height: 300,
        lang: 'ja-JP', /*日本語対応*/
        toolbar: [
            ['para', ['ul']],
            ['misc', ['codeview']]
        ],
        callbacks: {
            onPaste: function (e) {
                const bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                e.preventDefault();
                document.execCommand('insertText', false, bufferText);
            }
        }
    });
    $('.js-summernote_p').summernote({
        height: 300,
        lang: 'ja-JP', /*日本語対応*/
        styleTags: [
            'p', 'h5'
        ],
        toolbar: [
            ['para'],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['insert', ['link', 'picture', 'video']],
            ['misc', ['codeview']]
        ],
        popover: {
            image: [
                ['custom', ['imageTitle', 'captionIt']],
                ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
                ['remove', ['removeMedia']]
            ],
            link: [
                ['link', ['linkDialogShow', 'unlink']]
            ],
            air: [
                ['color', ['color']],
                ['font', ['bold', 'underline', 'clear']],
                ['para', ['ul', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']]
            ]
        },
        cleaner: {
            action: 'paste',
            newline: '<br>',
            keepClasses: true,
        },
        imageTitle: {
            specificAltField: true,
        },
        callbacks: {
            onImageUpload: function(files) {
                const $this = $(this);
                const formData = new FormData();
                formData.append("editor_upload_image[image]", files[0]);
                $.ajax({
                    url: '/admin/api/editor_upload_images',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function(data){
                        $this.summernote("insertImage", data.location, function ($image) {
                            $image.css('width', 'auto');
                        });
                    }
                });
            },
            onPaste: function (e) {
                const bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                e.preventDefault();
                document.execCommand('insertText', false, bufferText);
            }
        }
    });
    $('.js-summernote_pitch_content').summernote({
        height: 300,
        lang: 'ja-JP', /*日本語対応*/
        styleTags: [
            'p', 'h5', 'h6'
        ],
        toolbar: [
            ['para', ['style']],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['insert', ['link', 'picture', 'video']],
            ['misc', ['codeview']]
        ],
        popover: {
            image: [
                ['custom', ['imageTitle', 'captionIt']],
                ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
                ['remove', ['removeMedia']]
            ],
            link: [
                ['link', ['linkDialogShow', 'unlink']]
            ],
            air: [
                ['color', ['color']],
                ['font', ['bold', 'underline', 'clear']],
                ['para', ['ul', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']]
            ]
        },
        cleaner: {
            action: 'paste',
            newline: '<br>',
            keepClasses: true,
        },
        imageTitle: {
            specificAltField: true,
        },
        callbacks: {
            onImageUpload: function(files) {
                const $this = $(this);
                const formData = new FormData();
                formData.append("editor_upload_image[image]", files[0]);
                $.ajax({
                    url: '/admin/api/editor_upload_images',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function(data){
                        $this.summernote("insertImage", data.location, function ($image) {
                            $image.css('width', 'auto');
                        });
                    }
                });
            },
            onPaste: function (e) {
                const bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                e.preventDefault();
                document.execCommand('insertText', false, bufferText);
            }
        }
    });
}
