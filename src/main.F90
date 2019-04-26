PROGRAM MAIN
        use naivemath
        use bettermath
        use dotmath

        IMPLICIT NONE

        real::time,nexttime
        integer, dimension(8) :: numbers
        character(len=10)::mtype
        integer::kinda, i

        call get_command_argument(2,mtype)
        read(mtype(1:2),'(I2)') kinda
        call get_command_argument(1,mtype)

        numbers=(/10,20,40,80,160,320,640,1280/)
        do i=1,8
        IF(kinda .eq. 4) THEN
                PRINT '(I5," ",ES12.5)', numbers(i),  measure_4(numbers(i))
        ELSE IF(kinda .eq. 8) THEN
                PRINT '(I5," ",ES12.5)', numbers(i),  measure_8(numbers(i))
        ELSE
                PRINT '(I5," ",ES12.5)', numbers(i),  measure_16(numbers(i))
        END IF
        end do
Contains
        real FUNCTION measure_4(dim) result(time)
                integer, intent(in) :: dim
                real(kind=4), dimension(:,:), allocatable :: A, B, res

                call random_seed()

                allocate(A(dim, dim))
                allocate(B(dim, dim))
                allocate(res(dim, dim))

                call random_number(A)
                call random_number(B)

                call cpu_time(time)
                IF      (trim(mtype) .eq. "n") THEN
                        res = naivmull(A,B)
                ELSE IF (trim(mtype) .eq. "b") THEN
                        res = bettmull(A,B)
                ELSE IF (trim(mtype) .eq. "d")  THEN
                        res = dotmull(A,B)
                ELSE
                        res=matmul(A,B)
                END IF
                call cpu_time(nexttime)

                time=nexttime-time
        END FUNCTION measure_4

        real FUNCTION measure_8(dim) result(time)
                integer, intent(in) :: dim
                real(kind=8), dimension(:,:), allocatable :: A, B, res

                call random_seed()

                allocate(A(dim, dim))
                allocate(B(dim, dim))
                allocate(res(dim, dim))

                call random_number(A)
                call random_number(B)

                call cpu_time(time)
                IF      (trim(mtype) .eq. "n") THEN
                        res = naivmull(A,B)
                ELSE IF (trim(mtype) .eq. "b") THEN
                        res = bettmull(A,B)
                ELSE IF (trim(mtype) .eq. "d")  THEN
                        res = dotmull(A,B)
                ELSE
                        res=matmul(A,B)
                END IF
                call cpu_time(nexttime)

                time=nexttime-time
        END FUNCTION measure_8

        real FUNCTION measure_16(dim) result(time)
                integer, intent(in) :: dim
                real(kind=16), dimension(:,:), allocatable :: A, B, res

                call random_seed()

                allocate(A(dim, dim))
                allocate(B(dim, dim))
                allocate(res(dim, dim))

                call random_number(A)
                call random_number(B)

                call cpu_time(time)
                IF      (trim(mtype) .eq. "n") THEN
                        res = naivmull(A,B)
                ELSE IF (trim(mtype) .eq. "b") THEN
                        res = bettmull(A,B)
                ELSE IF (trim(mtype) .eq. "d")  THEN
                        res = dotmull(A,B)
                ELSE
                        res=matmul(A,B)
                END IF
                call cpu_time(nexttime)

                time=nexttime-time
        END FUNCTION measure_16
END PROGRAM MAIN
