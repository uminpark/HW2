class AgePredictor:
    def predict(self, data: dict) -> int:
        # 실제 ML 모델 로드 및 추론 로직이 들어가는 부분입니다.
        # 여기서는 간단히 이름 길이에 따라 나이를 반환하는 예시를 작성합니다.
        name = data.get("name", "")
        return 20 + len(name)

predictor = AgePredictor()