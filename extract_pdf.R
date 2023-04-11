if(! require(pdftools)){  #require加载,没有就返回FALSE
  install.packages("pdftools")
  library(pdftools)
}

pdf_handle <- function(temp , pdf_list , pages = 1:1){
  for(a_pdf in paste0(temp,"/",pdf_list)){
    pdf_subset(a_pdf , pages = pages , output = paste0(a_pdf , "-new"))
  }
  
  pdf_combine(paste0(temp,"/",pdf_list,"-new") , output = paste0(temp ,"/" ,"all.pdf"))
  
  for(a_pdf in paste0(temp,"/",pdf_list,"-new")){
    file.remove(a_pdf)
  }
}

pdf_list <- list.files("H:/文献" , pattern = "\\.pdf$")  #****

temp <- "H:/文献"
pdf_handle(temp , pdf_list )

