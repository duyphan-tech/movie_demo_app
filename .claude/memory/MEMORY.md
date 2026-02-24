# Personal Memory - Movie Demo App

## Preferences

### Communication Style
- Trả lờng ngắn gọn, đi thẳng vào vấn đề
- Dùng tiếng Việt khi hỏi bằng tiếng Việt
- Luôn giải thích "tại sao" khi đề xuất thay đổi kiến trúc

### Development Workflow
- Ưu tiên dùng FVM (`flutter` thay vì `fvm flutter` vì đã setup alias)
- Thích dùng `build_runner watch` trong terminal riêng
- Muốn tự chạy test trước khi commit, không cần auto-run

## Commit Checklist

### Pre-Commit Commands (Chạy trước khi commit)
```bash
# 1. Format code
dart format lib/ test/

# 2. Analyze code
flutter analyze

# 3. Run tests
flutter test

# 4. Check for hardcoded secrets (thủ công)
grep -r "api_key\|password\|secret" lib/ --include="*.dart" | grep -v ".g.dart"
```

### Checklist trước khi commit
- [ ] Code đã được format (`dart format`)
- [ ] `flutter analyze` không có lỗi
- [ ] `flutter test` pass hết
- [ ] Không commit file `.g.dart` riêng lẻ (chỉ commit khi đi kèm file gốc)
- [ ] Không có hardcoded API keys, secrets
- [ ] Commit message rõ ràng, mô tả đúng thay đổi

### Commit Message Convention
```
<type>: <subject>

<body> (optional)
```

**Types:**
- `feat`: Feature mới
- `fix`: Bug fix
- `refactor`: Tái cấu trúc code không đổi behavior
- `chore`: Cập nhật config, dependencies, build
- `docs`: Thêm/sửa documentation
- `test`: Thêm/sửa tests

**Examples:**
```
feat: add pull-to-refresh on movie list screen

fix: handle null poster_path in MovieModel

refactor: extract movie card widget to separate file
```

## Project Insights

### Architecture Decisions
- Đang dùng Riverpod 3.x với code generation
- Repository pattern với `fpdart` cho error handling
- go_router cho navigation với deep linking

### Common Issues & Solutions
<!-- Thêm vào đây khi gặp lỗi lặp lại -->

### Useful Commands
```bash
# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (chạy ở terminal riêng)
flutter pub run build_runner watch

# Run với dev flavor
flutter run lib/main_dev.dart --flavor dev \
  --dart-define TMDB_API_KEY=$TMDB_API_KEY \
  --dart-define TMDB_URL=https://api.themoviedb.org/3
```

## Feature Backlog (Personal)
<!-- Ghi chú các feature muốn làm sau -->
