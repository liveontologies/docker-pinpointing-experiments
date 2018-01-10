FROM openjdk:8u151-jdk

ENV PINPOINTING_JAR pinpointing-experiments-0.1.1-SNAPSHOT-ab5e3a7-jar-with-dependencies.jar
ENV EL2MCS_DIR el2mcs
ENV EL2MUS_DIR el2mus
ENV SATPIN_EXE SATPin

WORKDIR /home/pinpointing

COPY . /home/pinpointing

RUN apt-get update && apt-get install -y --no-install-recommends \
		bc \
	&& rm -rf /var/lib/apt/lists/* ; \
	unzip $PINPOINTING_JAR 'scripts/*'

EXPOSE 80

# Must be in the shell form so that the variable substitution works
CMD java -cp $PINPOINTING_JAR org.liveontologies.pinpointing.ExperimentServer --ontologies ontologies.tar.gz --results results.tar.gz \
	./scripts/run_ELK-SAT_experiments.sh '<t>' '<g>' ontologies.tar.gz experiments docker $PINPOINTING_JAR scripts workspace results.tar.gz '<q>'
