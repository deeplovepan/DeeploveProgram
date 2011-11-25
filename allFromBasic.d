pid$target::test:entry
{
   self->follow = 1;
}

pid$target::test:return
{
   self->follow = 0;
}

pid$target:::entry
/ self->follow /
{
}
