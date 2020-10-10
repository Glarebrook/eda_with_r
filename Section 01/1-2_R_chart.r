df <- tibble( fruit = c("Apple", "Banana", "Grapes", "Kiwi"), 
              people = c(40, 50, 30, 15) )


str(df$fruit)
## 바 차트
bar <- ggplot(data=df, aes(x=fruit, y=people, fill=fruit))+
  geom_bar(stat='identity')+theme(legend.position="none")
bar

bar+scale_fill_manual(values=c("#CCCCCC", "#66CC66", "#CCCCCC", "#CCCCCC"))





df <- tibble( fruit = c("Apple", "Banana", "Grapes", "Kiwi"), 
              people = c(40, 50, 30, 15) )

df$fruit <- factor(df$fruit, levels=c("Banana", "Grapes", "Kiwi", "Apple"))


## 파이차트

bp <- ggplot(
  df, aes(x="", y=people,fill = fruit))+
      geom_bar(width=1, stat='identity', color='black')+
  theme(axis.line=element_blank(), axis.text=element_blank(), axis.ticks=element_blank())

y.breaks

df$fruit

## 급간 만드는 부분 참고
y.breaks <- cumsum( rev(df[order(df$fruit),]$people)) - rev(df[order(df$fruit),]$people/2)
y.breaks

pie <- bp+coord_polar("y", start=0, direction = -1)+
labs(x=NULL, y=NULL)+
geom_text(aes(label=people), position = position_stack(vjust=0.5))+
  theme_classic()+
  theme(axis.line=element_blank(), axis.ticks=element_blank()) +
  scale_y_continuous(breaks=y.breaks, labels=rev(df$fruit[order(df$fruit)]) )+
  theme(legend.position = "none")
pie+scale_fill_manual(values=c("#CCCCCC", "#CCCCCC", "#CCCCCC", "#CC6666"))

## 히스토그램
str(airquality)

hist <- ggplot(airquality, aes(x=Temp))+
  geom_histogram(binwidth = 4,  color='black')
hist

airquality$Temp

 table(airquality$Temp)
 
## 산점도
scat <- ggplot(airquality, aes(x=Temp, y=Ozone))+
  geom_point()
scat
