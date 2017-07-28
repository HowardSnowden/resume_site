



function genPDF(e){

  
 $('#pdfbutton a').text('loading...').attr('href', '#');

  $('#pdf-body').html($('#wrapper').html());
  $('#pdf-body')
  .children()
  .first()
  .width('900px')
  .css('margin', 'auto')
  .children('#pdfbutton').hide();
  $('#pdf-body hr').css('border-top', '2px solid rgba(0, 0, 0, 0.8)');
  $('#pdf-body a').css({'color':'inherit', 'text-decoration':'none'} );

  $('#pdf-body .project-wrap').css('margin-top', '20px');
  $('#pdf-body li').css('display', 'list-item');
  var elems_increased = [];
  $('#content').find('h1, h2, h3, h4, h5, h6, p, li, small').each(function(){
      
      var elemType = $(this).context.localName;

      if (elems_increased.indexOf(elemType) < 0){ 
       var new_font_size = parseInt($(this).css('font-size') ) + 3;
       $('#pdf-body '+ elemType).css('font-size', new_font_size + "px");
        elems_increased.push($(this).context.localName);
    }

  });
  // $('#pdf-body h1').css('font-size', '36px');
  // $('#pdf-body h2').css('font-size', '30px');
  // $('#pdf-body p, #pdf-body li').css('font-size', '17px');
  // $('#pdf-body h4')

  var resume = document.getElementById('pdf-body');

        html2canvas(resume, {
            onrendered: function(canvas) {
 		    
            //! MAKE YOUR PDF
            var pdf = new jsPDF('p', 'pt', 'letter', true);
          
           
            for (var i = 0; i <= resume.clientHeight/980; i++) {
                //! This is all just html2canvas stuff
                var srcImg  = canvas;
                var sX      = 0;
                var sY      = 980*i; // start 980ixels down for every new page
                var sWidth  = 900;
                var sHeight = 980;
                var dX      = 0;
                var dY      = 0;
                var dWidth  = 900;
                var dHeight = 980;

                window.onePageCanvas = document.createElement("canvas");
                onePageCanvas.setAttribute('width', 900);
                onePageCanvas.setAttribute('height', 980);
                var ctx = onePageCanvas.getContext('2d');
                // details on this usage of this function: 
                // https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Using_images#Slicing
                ctx.drawImage(srcImg,sX,sY,sWidth,sHeight,dX,dY,dWidth,dHeight);

                // document.body.appendChild(canvas);
                var canvasDataURL = onePageCanvas.toDataURL("image/png", 1.0);

                var width         = onePageCanvas.width;
                var height        = onePageCanvas.clientHeight;

                //! If we're on anything other than the first page,
                // add another page
                if (i > 0) {
                    pdf.addPage(612, 791); //8.5" x 11" in pts (in*72)
                }
                //! now we declare that we're working on that page
                pdf.setPage(i+1);
                //! now we add content to that page!
                pdf.addImage(canvasDataURL, 'PNG', 20, 40, (width*.62), (height*.62), undefined, 'FAST');

            }
            //! after the for loop is finished running, we save the pdf.
           pdf.save('Damien-Pyles-Resume.pdf');
             $('.loader').hide();
            $('#pdfbutton a').attr('href', "javascript:genPDF()").text('Save PDF');
        }
      });
  }

function callback(pos){
    $("#loader").css('width',20*(pos/1000)+"px");
}