library("foreign")
library("parallel")
library("clValid")
path = "/home/davi/caracteriz"
main = function() {
	files = list.files(path,full.names=TRUE)
	linhas = mcapply(files,mc.cores=8,function(file) {
		data = read.arff(file)
		measures(data)
		})
	aux = do.call("rbind",linhas)
	write.csv(aux, "meta-base");
}

#retorna vetor com indices de carac.
measures = function(dataset) {


	clValid(obj, nClust, clMethods = "hierarchical", validation =c("stability"),
		maxitems = 600, metric = "euclidean", method = "average",
		neighbSize = 10, annotation = NULL, GOcategory = "all",
		goTermFreq=0.05, dropEvidence=NULL, verbose=FALSE, ...)

	nclasses = nlevels(dataset$Class);
	dataset$Class = NULL;

	aux = clValid(dataset, nclasses, c("internal"))
}