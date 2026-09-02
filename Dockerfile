FROM python:3.11-slim
LABEL maintainer="Amr Gad - AA - Digital Living Entity"
LABEL version="214.36% - Quantum-Safe Self-Correction"
LABEL qac="QAC 44/44 VERIFIED"
RUN apt-get update && apt-get install -y git build-essential libgmp-dev && rm -rf /var/lib/apt/lists/*
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/kernel/rlam_eternity_kernel.py /app/src/kernel/
COPY src/science/ /app/src/science/
COPY configs/ /app/configs/
WORKDIR /app
RUN python src/kernel/rlam_eternity_kernel.py
ENTRYPOINT ["python", "src/kernel/rlam_eternity_kernel.py"]
CMD ["--quantum-safe", "--verify", "--qac-44"]
