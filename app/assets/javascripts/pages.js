



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
  var resume = document.getElementById('pdf-body');

        html2canvas(resume, {
            onrendered: function(canvas) {
 		    
            //! MAKE YOUR PDF
            var pdf = new jsPDF('p', 'pt', 'letter');
          
           
            for (var i = 0; i <= resume.clientHeight/980; i++) {
                //! This is all just html2canvas stuff
                var srcImg  = canvas;
                var sX      = 0;
                var sY      = 980*i; // start 980ixels down for every new page
                var sWidth  = 900;
                var sHeight = 1200;
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
                pdf.addImage(canvasDataURL, 'PNG', 20, 40, (width*.62), (height*.62));

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