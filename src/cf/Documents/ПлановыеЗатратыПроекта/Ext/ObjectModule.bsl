﻿Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	Автор = ПараметрыСеанса.ТекущийПользователь;
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	// регистр ЗатратыПоПроектам Приход
	Сумма = 0;
	Движения.ЗатратыПоПроектам.Записывать = Истина;
	Для Каждого ТекСтрокаСтатьиЗатрат Из СтатьиЗатрат Цикл
		 Сумма = Сумма + ТекСтрокаСтатьиЗатрат.СуммаРасходов;
	КонецЦикла;
	Движение = Движения.ЗатратыПоПроектам.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Сумма = Сумма;
	Движение.Организация = Организация;
	Движение.Автор = Автор;
	Движение.Проект = Проект;
	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры


