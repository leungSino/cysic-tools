# Use the NVIDIA CUDA base image with runtime support  
FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04  
RUN apt-get update && apt-get install -y vim wget curl sqlite3\
    && rm -rf /var/lib/apt/lists/*  # Clean up  

# Set the working directory  
WORKDIR /root/cysic-prover 

# set LD_LIBRARY_PATH for prover
ENV LD_LIBRARY_PATH=/root/cysic-prover:$LD_LIBRARY_PATH
ENV REWARD_ADDRESS=0x0000000000000000000000000000000000000000

# Copy your application files into the container  
COPY ./cysic-prover /root/cysic-prover 
COPY ./.scroll_prover /root/.scroll_prover

# Set the entry point to your application  
# ENTRYPOINT ["bash"]
ENTRYPOINT ["bash", "/root/cysic-prover/setup_and_run.sh"]
