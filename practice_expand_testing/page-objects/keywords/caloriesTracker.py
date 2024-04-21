from robot.api.deco import keyword


def addition(num1, num2):
    return int(num1) + int(num2)


def subtraction(num1, num2):
    return int(num1) - int(num2)

class operations:

    @keyword
    def calculate_the_calories(self, num1, num2, operator):
        if operator == 'addmeal':
            return addition(num1, num2)
        elif operator == 'deletemeal':
            return subtraction(num1, num2)
        else:
            raise ValueError('Invalid operator')

# if __name__ == "__main__":
#     ops = operations()
#     print(ops.calculate_the_calories(10, 20, 'addmeal'))