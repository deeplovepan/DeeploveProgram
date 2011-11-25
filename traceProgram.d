pid$1:::entry
/probemod == "Virtual"/
{
    printf("%s %s\n", probefunc, probemod);
}

pid$1:::return
/probemod == "Virtual"/
{
    printf("%s %s\n", probefunc, probemod);

}
