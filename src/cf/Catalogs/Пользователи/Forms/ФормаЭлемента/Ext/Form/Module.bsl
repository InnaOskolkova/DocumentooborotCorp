﻿
&НаСервере
Процедура РольНачалоВыбораНаСервере(Загружено)	
	КоллекцияРолей = Метаданные.Роли;
	МассивРолей = Новый Массив;
	Для Каждого Роль Из КоллекцияРолей Цикл
		МассивРолей.Добавить(Роль.Имя);	
	КонецЦикла; 		
	Элементы.Роль.СписокВыбора.ЗагрузитьЗначения(МассивРолей);
КонецПроцедуры

&НаКлиенте
Процедура РольНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)	
	СтандартнаяОбработка = Ложь;
	Если Не ЭтаФорма.РолиЗагружены Тогда
		РольНачалоВыбораНаСервере(РолиЗагружены);
		ЭтаФорма.РолиЗагружены = Истина;
	КонецЕсли;
	Оповещение = Новый ОписаниеОповещения("ПослеВыбораЭлемента",ЭтотОбъект);
	Элементы.Роль.СписокВыбора.ПоказатьВыборЭлемента(Оповещение);	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораЭлемента(ВыбранныйЭлемент, СписокПараметров) Экспорт
	ПрошлаяРоль = Объект.Роль;
	Если ВыбранныйЭлемент = Неопределено Тогда
		Если ПрошлаяРоль = "" Тогда
			Сообщить("Не выбрано значение");
		Иначе 
			Объект.Роль = ПрошлаяРоль; 	
		КонецЕсли;
    Иначе
        Объект.Роль = ВыбранныйЭлемент.Значение;
    КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура РольОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Объект.Роль = ВыбранноеЗначение;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ЭтаФорма.РолиЗагружены = Ложь;
КонецПроцедуры

