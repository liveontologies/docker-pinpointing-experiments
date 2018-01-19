FROM openjdk:8u151-jdk

ENV CLASSPATH 'maven/*'
ENV EL2MCS_DIR el2mcs
ENV EL2MUS_DIR el2mus
ENV SATPIN_EXE SATPin

WORKDIR /home/pinpointing

COPY . /home/pinpointing

RUN apt-get update && apt-get install -y --no-install-recommends \
		bc \
		r-base-core \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 80

# Must be in the shell form so that the variable substitution works
CMD java -cp 'maven/*' org.liveontologies.pinpointing.ExperimentServer --workspace workspace \
	./scripts/run_ELK-SAT_experiments.sh '<t>' '<g>' '<s>' '<o>' docker scripts workspace '<q>'