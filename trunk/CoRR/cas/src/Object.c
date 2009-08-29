/*
** Object.c
** 
** Made by (Alex Nelson)
** Login   <alex@tomato>
** 
** Started on  Fri Aug 28 18:05:13 2009 Alex Nelson
** Last update Sun May 12 01:17:25 2002 Speed Blue
*/

#include "Object.h"

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
