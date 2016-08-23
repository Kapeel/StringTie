# StringTie 
# VERSION             1.2.4
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running StringTie assembly and quantification tool for RNA seq data "
RUN apt-get update && apt-get install -y build-essential wget python \
ADD StringTie.pl /usr/bin/ \
ADD prepDE.py /usr/bin/prepDE.py \
RUN [ "chmod", "+x", "/usr/bin/STAR_align.pl" ] \
RUN [ "chmod", "+x", "/usr/bin/" ] \
RUN wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-1.2.4.Linux_x86_64.tar.gz . \
&& tar -xvf stringtie-1.2.4.Linux_x86_64.tar.gz \
&& mv stringtie-1.2.4.Linux_x86_64 stringtie-1.2.4

ENTRYPOINT ["StringTie.pl","-h"]
