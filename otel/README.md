# Kbot Monitoring Stack

Цей репозиторій містить стек для моніторингу бота **Kbot** з використанням OpenTelemetry, Prometheus, Grafana, FluentBit та Loki.

## Компоненти стека

- **Kbot** – Telegram-бот для демонстрації метрик.
- **OpenTelemetry Collector** – збір і експорт метрик.
- **Prometheus** – збір і зберігання метрик.
- **FluentBit** – збір логів контейнерів.
- **Grafana Loki** – зберігання та пошук логів.
- **Grafana** – візуалізація метрик та логів.

---

## Попередні умови

- [Docker](https://docs.docker.com/get-docker/) ≥ 20.x
- [Docker Compose](https://docs.docker.com/compose/install/) ≥ 2.x
- TELEGRAM BOT TOKEN для Kbot
- **GitHub Codespace** (якщо запускаєте у Codespace)

---

## 1️⃣ Клонування репозиторію

```bash
git clone https://github.com/laskavchuk/kbot.git
cd kbot/otel
```

## 2️⃣ Встановлення змінних середовища

Встановлення змінних середовища
Встановіть токен Telegram:
```
export TELE_TOKEN=YOUR_TELEGRAM_BOT_TOKEN
```

## 3️⃣ Запуск стека моніторингу
```
docker-compose up -d
```
Прапорець -d піднімає всі сервіси у фоні.

Контейнери:
- Kbot
- OpenTelemetry Collector
- Prometheus
- FluentBit
- Loki
- Grafana

## 4️⃣ Доступ до сервісів

Grafana
- Порт: 3002
- В Codespace: відкрий Ports panel, знайди 3002 → Forward to Browser
Prometheus
- Порт: 9090
- Доступ через браузер (так само через Ports panel у Codespace)
Loki
- Порт: 3100
- Доступ через Grafana → Data sources

## 5️⃣ Перезапуск/зупинка
Перезапуск
```
docker-compose down
docker-compose up -d
```
Зупинка
```
docker-compose down
```

## 6️⃣ Перевірка логів
```
docker-compose logs -f kbot
docker-compose logs -f grafana
docker-compose logs -f prometheus
```

## 7️⃣ Демонстрація Grafana
## Дашборд

![Дашборд](https://raw.githubusercontent.com/Laskavchuk/kbot/main/.data/home_grafana.gif)
## Prometheus

![Prometheus](https://raw.githubusercontent.com/Laskavchuk/kbot/main/.data/prometheus_grafana.gif)
## Loki

![Loki](https://raw.githubusercontent.com/Laskavchuk/kbot/main/.data/loki_grafana.gif)
  

