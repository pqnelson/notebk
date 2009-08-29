#include <iostream>
#include <sstream>
#include <string>


class Object
{
public:
	bool equals(Object *pObject) const;
	bool equals(const Object &pObject) const;
	std::string getClass() const;
	int hashCode() const;
	std::string toString() const;
	/* operator overloading */
	bool operator==(Object const &);
protected:
	Object* clone();
	void finalize();
};

std::ostream &operator<<(std::ostream &str, const Object &pObject)
{
	str<<(pObject.toString());
	return str;
}

bool Object::equals(Object *pObject) const
{
	return (hashCode()==pObject->hashCode());
}
bool Object::equals(const Object &pObject) const
{
	return (hashCode()
		==
		pObject.hashCode());
}
std::string Object::getClass() const
{
	return "Object";
}
int Object::hashCode() const
{
	return (int)this;
}
std::string Object::toString() const
{
	std::stringstream s;
	s<<getClass()
	 <<"@0x"
	 <<std::hex<<hashCode();
	return s.str();
}
bool Object::operator==(Object const &pObject)
{
	return this->equals(pObject);
}

int main()
{
	Object foo;
	std::cout<<foo<<std::endl;
	return 0;
}
