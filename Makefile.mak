CC = gcc
CFLAGS = -Wall -Wextra

TARGET = calendar
SRC = src/calendar.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

run:
	./$(TARGET)

clean:
	rm -f $(TARGET)
