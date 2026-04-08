# 1. 가볍고 보안이 강화된 Python Slim 이미지 사용
FROM python:3.11-slim

# 2. 컨테이너 내 작업 디렉토리 설정
WORKDIR /app

# 3. 환경 변수 설정 (파이썬 로그가 즉시 출력되도록 설정)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 4. 의존성 파일만 먼저 복사 (캐시 효율화: 소스 코드가 바뀌어도 패키지가 안 바뀌면 빌드 건너뜀)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. 전체 소스 코드 복사
COPY . .

# 6. 보안을 위해 루트 권한이 아닌 일반 사용자 계정으로 실행 (추천 사항)
RUN useradd -m appuser
USER appuser

# 7. 서비스 포트 노출 및 앱 실행
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]