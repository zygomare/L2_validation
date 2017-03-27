#' Reads optics input coming from IML Buoy and returns a list of field containing all the input stored in the OPTIC file. (see example)
#' @export read.pix_Extract
#' @param fname Filename
#' @return Data frame with the result of the pixel extraction 
#' 
#' @examples
#' # read an pixel extraction file from snap
#' setwd(path.package(""))
#' raw = read.pix_Extract("input/Pix_extract_S3_30072016.txt")
#' str(raw)
#'
#'
#'
#'



read.pix_Extract <- function(filen) {
  
  con = file(filen, encoding = "latin1")
  # read in the lines and delete all except those containing "S="
  input <- readLines(con)
  index <- grep("# Wavelength:", input)
  wave_tmp=unlist(strsplit(input[index],"\t"))
  wave=as.numeric(wave_tmp)[which(as.numeric(wave_tmp)!=0)]
  header= unlist(strsplit(input[index+1], "\t"))
  
  input.data <- input[c((index+2):length(input))]
  close(con)
  nrec = length(input.data)
  tmp = unlist(strsplit(input.data, "\t"))
  tmp.mat = matrix(tmp, ncol =length(unlist(strsplit(input, "\t")[[nrec]])), nrow = nrec, 
                                 byrow = T)
  tab_pixextract = tmp.mat
  
  return(list(wave=wave,header=header,data=tab_pixextract))
}