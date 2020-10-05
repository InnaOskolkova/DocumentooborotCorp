﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Справочники.ВнутренниеДокументы.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ВнутренниеДокументы.Автор,
	|	ВнутренниеДокументы.Вид,
	|	ВнутренниеДокументы.Имя,
	|	ВнутренниеДокументы.ИННОрганизации,
	|	ВнутренниеДокументы.Код,
	|	ВнутренниеДокументы.Комментарий,
	|	ВнутренниеДокументы.КонтактноеЛицо,
	|	ВнутренниеДокументы.Контрагент,
	|	ВнутренниеДокументы.Наименование,
	|	ВнутренниеДокументы.Организация,
	|	ВнутренниеДокументы.Отчество,
	|	ВнутренниеДокументы.Согласован,
	|	ВнутренниеДокументы.Фамилия,
	|	ВнутренниеДокументы.ЭтоДоговор,
	|	ВнутренниеДокументы.Предметы.(
	|		НомерСтроки,
	|		Предмет
	|	)
	|ИЗ
	|	Справочник.ВнутренниеДокументы КАК ВнутренниеДокументы
	|ГДЕ
	|	ВнутренниеДокументы.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьПредметыШапка = Макет.ПолучитьОбласть("ПредметыШапка");
	ОбластьПредметы = Макет.ПолучитьОбласть("Предметы");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьПредметыШапка);
		ВыборкаПредметы = Выборка.Предметы.Выбрать();
		Пока ВыборкаПредметы.Следующий() Цикл
			ОбластьПредметы.Параметры.Заполнить(ВыборкаПредметы);
			ТабДок.Вывести(ОбластьПредметы, ВыборкаПредметы.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
