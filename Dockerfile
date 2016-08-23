# STAR 
# VERSION              2.5.2.a
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running StringTie assembly and quantification tool for RNA seq data "
RUN apt-get update && apt-get install -y build-essential wget \
ADD STAR_align.pl /usr/bin/ \
RUN [ "chmod", "+x", "/usr/bin/STAR_align.pl" ] \
RUN wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-1.2.4.Linux_x86_64.tar.gz . \
&& tar -xvf stringtie-1.2.4.Linux_x86_64.tar.gz \
&& mv stringtie-1.2.4.Linux_x86_64 stringtie-1.2.4 \ 
&& cp stringtie-1.2.4/stringtie /usr/bin/


ENTRYPOINT ["STAR_align.pl","-h"]
