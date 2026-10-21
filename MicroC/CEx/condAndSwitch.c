void main(int month)
{
    int days;
    days = 0;
    switch (month)
    {
    case 1:
    {
        days = 31;
    }
    case 2:
    {
        int y;
        y = 2024;
        days = 28;
        if (y % 4 == 0)
            days = 29;
    }
    case 3:
    {
        days = 31;
    }
    }
    print days;
    print(days > 30 ? 1 : 0);
}