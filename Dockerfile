FROM python:3.10-slim

WORKDIR /app

# Poetry 설치
RUN pip install poetry

# 프로젝트 파일 복사
COPY pyproject.toml poetry.lock* /app/

# Poetry를 사용하여 의존성 설치
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi --no-root

# 소스 파일을 이미지에 복사
COPY . /app

# 업로드된 파일을 저장할 디렉터리 생성
RUN mkdir uploaded_files

# FastAPI를 실행할 명령어 설정
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["python3" "main.py"]
