#include <osv/vmfunc.hh>

long vmfunc(long p1, long p2, long p3, long n, long p4, long p5)
{
    asm("movq %0, %%rcx;"
        : 
        : "r"(n)
        : "rcx");
    long r = trampoline();
    if (n == 0)
        install();
    return r;
}

void install()
{
    uint64_t target_rsp = 0xffff800002000000;
    // target_rsp -= ((uint64_t)1 << 0x20);
    __asm__ volatile("mov %rsp, %r10;");
    for (int i = 1; i <= 1024; i++)
    {
        __asm__ volatile("movq %0, %%rsp;"
                         "push %%rsp;"
                         :
                         : "r"(target_rsp)
                         : "rsp");
        target_rsp -= (1 << 0x12);
    }
    __asm__ volatile("mov %r10, %rsp;");
}