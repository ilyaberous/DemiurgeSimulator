# Описание проекта

Данное приложение представляет из себя симулятор демиурга Шамбабмукли. 
Создавая новый мир, он наполняет его клетками. 
Каждый раз, нажимая на кнопку в приложении, в список клеток добавляется новая:

— равновероятно она может быть как живой, так и мёртвой;

— жизнь зарождается, если до этого трижды подряд создалась живая клетка;

— если трижды подряд родилась мёртвая клетка, жизнь рядом умирает. 

## Как сделано

Во избежание увеличения зависимостей и сложности сборки мною было решено не использовать сторонние библиотеки и фреймворки (например, SnapKit).

В итоге, проект был разработан на чистом **UIKit**, c использованием архитектурного подохода **MVVM + Delegates** (делегаты взяты опять же из-за простоты)

![Simulator Screen Recording - iPhone 14 Pro - 2024-07-14 at 03 02 04](https://github.com/user-attachments/assets/438b08fb-55d7-4f35-bec5-37f003646b69)

### Важные замечания
❗ Осторожно ❗ Много Букв ❗

1. Исходя из предоставленного описания было не совсем понятно, что же все таки-происходит при рождении трижды мертвой клетки.
Например, можно подумать, что под жизнью понимается только та самая жизнь, которая появляется после рождения живых клеток 3 раза подряд.
Однако можно понять жизнь - как вообще все живое (и жизнь, и живые клетки).
Кроме того, непонятно - "рядом" - это насколько позиций. Можно понять, что на одну позицию, но можно подумать и что имеются в виду все позиции до ближайшей мертвой клетки.\
Таким образом, я решил сделать так, как, мне кажется, будет логично в контексте игры - *убивать все живые клетки до первой мертвой.*

2. Это замечание не касается логики работы приложения, но тоже хочется прояснить данный момент.
Так как в макете проекта в Figma компонент с лейблом "Клеточное наполнение" больше по высоте, чем обычный navigation bar, то изначально я решил сделать его как headerView у tableView.
Однако как мне показалось, данный элемент не должен исчезать с экрана при скролле вниз, но реализовать это с хедером показалось слишком сложной и ненужной задачей.
В итоге я решил сделать этот компонент просто отдельной вьюшкой. 


## Требования

**IOS 16.2+**

(так как в условии не было уточнено какие версии IOS должно поддерживать приложение, была оставлена версия по дефолту) 


